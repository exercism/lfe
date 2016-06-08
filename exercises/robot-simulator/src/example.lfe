(defmodule robot-simulator
  (export (create 0)
          (place 3)
          (direction 1)
          (position 1)
          (left 1)
          (right 1)
          (advance 1)
          (control 2)

          ;; gen_server stuff
          (init 1)
          (handle_cast 2)
          (handle_call 3))
  (behaviour gen_server))

(defrecord robot
  pid)

(defrecord robot_info
  (position (tuple 'undefined 'undefined))
  direction)

;; public API
;; ==========

(defun create ()
  (let [((tuple 'ok pid) (gen_server:start_link 'robot-simulator '() '()))]
    (make-robot pid pid)))

(defun place (robot dir pos)
  (let [(pid (robot-pid robot))]
    (gen_server:cast pid (tuple 'position  pos))
    (gen_server:cast pid (tuple 'direction dir))))

(defun direction (rob)
  (gen_server:call (robot-pid rob) 'direction))

(defun position (rob)
  (gen_server:call (robot-pid rob) 'position))

(defun left (rob)
  (gen_server:cast (robot-pid rob) (tuple 'turn 'left)))

(defun right (rob)
  (gen_server:cast (robot-pid rob) (tuple 'turn 'right)))

(defun advance (rob)
  (gen_server:cast (robot-pid rob) 'advance))

(defun control (rob commands)
  (lists:foldl (match-lambda [(#\R _) (right rob)]
                             [(#\L _) (left  rob)]
                             [(#\A _) (advance rob)]
                             [(_   _) 'ok])
               '()
               commands))

;; gen_server API
;; ==============

(defun init (_)
  (tuple 'ok (make-robot_info)))

(defun handle_cast
  [((tuple 'position  pos) ri) (tuple 'noreply (set-robot_info-position  ri pos))]
  [((tuple 'direction dir) ri) (tuple 'noreply (set-robot_info-direction ri dir))]
  [((tuple 'turn 'left)  ri) (handle_cast (tuple 'direction (turn_left  (robot_info-direction ri))) ri)]
  [((tuple 'turn 'right) ri) (handle_cast (tuple 'direction (turn_right (robot_info-direction ri))) ri)]
  [('advance ri) (handle_cast (tuple 'position (advance (robot_info-position ri)
                                                        (robot_info-direction ri)))
                              ri)])

(defun handle_call
  [('direction _ ri) (tuple 'reply (robot_info-direction ri) ri)]
  [('position  _ ri) (tuple 'reply (robot_info-position  ri) ri)])




;; Private helper functions
;; ========================

(defun turn_left
  [('north) 'west]
  [('west)  'south]
  [('south) 'east]
  [('east)  'north])

(defun turn_right
  [('north) 'east]
  [('east)  'south]
  [('south) 'west]
  [('west)  'north])

(defun advance
  [((tuple x y) 'east)  (tuple (+ x 1) y)]
  [((tuple x y) 'west)  (tuple (- x 1) y)]
  [((tuple x y) 'north) (tuple x (+ y 1))]
  [((tuple x y) 'south) (tuple x (- y 1))])
