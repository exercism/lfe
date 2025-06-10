(defmodule armstrong-numbers
  (export (armstrong-number? 1)))

(defun armstrong-number? (number)
  (let* ((digits (digits-of number))
          (len (length digits))
          (sum (lists:foldl (lambda (digit acc)
                                      (+ acc (floor (math:pow digit len))))
                            0
                            digits)))
    (=:= sum number)))

(defun digits-of (number)
  (do-digits-of number '()))

(defun do-digits-of
  ((0 acc)
    (lists:reverse acc))
  ((n acc) (when (>= n 10))
    (do-digits-of (div n 10) (cons (rem n 10) acc)))
  ((n acc)
    (cons n acc)))
