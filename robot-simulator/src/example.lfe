(defmodule robot-simulator
  (export (advance 1)
          (control 2)
          (create 0)
          (direction 1)
          (left 1)
          (place 3)
          (position 1)
          (right 1)))

(defun advance (robot) (! robot 'advance))

(defun control (robot string)
  (lists:filtermap
    (lambda (char)
      (let ((f (control-function char)))
        (andalso (is_function f) `#(true ,(funcall f robot)))))
    string))

(defun create ()
  (spawn (lambda () (loop 'undefined `#(undefined undefined)))))

(defun left (robot) (! robot `#(turn left)))

(defun direction (robot) (request robot 'direction))

(defun place (robot direction position)
  (! robot `#(place ,direction ,position)))

(defun position (robot) (request robot 'position))

(defun right (robot) (! robot `#(turn right)))

(defun control-function
  ([#\A] #'advance/1)
  ([#\L] #'left/1)
  ([#\R] #'right/1)
  ([_c]  '()))

(defun loop (direction position)
  (receive
    ('advance
     (loop direction (new-position direction position)))
    (`#(direction ,pid)
     (! pid `#(direction ,direction))
     (loop direction position))
    (`#(turn ,turn)
     (loop (new-direction direction turn) position))
    (`#(place ,new-direction ,new-position)
     (loop new-direction new-position))
    (`#(position ,pid)
     (! pid `#(position ,position))
     (loop direction position))))

(defun new-direction
  (['north 'right] 'east)
  (['south 'right] 'west)
  (['east  'right] 'south)
  (['west  'right] 'north)
  (['north 'left]  'west)
  (['south 'left]  'east)
  (['east  'left]  'north)
  (['west  'left]  'south))

(defun new-position
  (['north `#(,x ,y)] `#(,x ,(+ y 1)))
  (['south `#(,x ,y)] `#(,x ,(- y 1)))
  (['east  `#(,x ,y)] `#(,(+ x 1) ,y))
  (['west  `#(,x ,y)] `#(,(- x 1) ,y)))

(defun request (robot request)
  (! robot `#(,request ,(self)))
  (receive
    (`#(,request ,answer) answer)))
