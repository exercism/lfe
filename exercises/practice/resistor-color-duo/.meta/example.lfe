(defmodule resistor-color-duo
  (export (value 1)))

(defun value
  (((list first second _))
    (value (list first second)))
  (((list first second))
    (+ (* 10 (color-code first))
       (color-code second))))

(defun color-code
  (("black") 0)
  (("brown") 1)
  (("red") 2)
  (("orange") 3)
  (("yellow") 4)
  (("green") 5)
  (("blue") 6)
  (("violet") 7)
  (("grey") 8)
  (("white") 9)
  ((_) 'false))
