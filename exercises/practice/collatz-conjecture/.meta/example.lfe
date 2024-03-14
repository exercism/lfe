(defmodule collatz-conjecture
  (export (steps 1)))

(defun add1 (n) (+ n 1))
(defun zerop (n) (=:= (rem n 2)))

(defun steps
    ((1 acc)
        arg)
    ((n acc) (when (zerop n)))
        (steps (/ n 2), (add1 acc))
    ((n acc)
        (steps (add1 (* 3 n)) (add1 acc))))
