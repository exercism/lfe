(defmodule collatz-conjecture
  (export (steps 1)))

(defun add1 (n) (+ n 1))

(defun zerop (n) (=:= (rem n 2)))

(defun steps (start)
  (do-steps start 0))

(defun do-steps
  ((n _) (when (< n 1))
    (error "Only positive integers are allowed"))
  ((1 acc)
    acc)
  ((n acc) (when (=:= (rem n 2) 0))
    (do-steps (div n 2) (add1 acc)))
  ((n acc)
    (do-steps (add1 (* 3 n)) (add1 acc))))
