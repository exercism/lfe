(defmodule square-root
  (export (calculate 1)))

(defun calculate
    ((1) 1)
    ((radicand) (sqrt radicand
                      (div radicand 2))))

(defun sqrt
    ((radicand guess) (when (=:= radicand
                                 (* guess guess)))
        guess)
    ((radicand guess)
        (sqrt radicand (div (+ guess
                             (div radicand guess))
                        2))))