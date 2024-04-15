(defmodule resistor-color
    (export (color-code 1) (colors 0)))

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

(defun colors ()
  '("black"
    "brown"
    "red"
    "orange"
    "yellow"
    "green"
    "blue"
    "violet"
    "grey"
    "white"))
