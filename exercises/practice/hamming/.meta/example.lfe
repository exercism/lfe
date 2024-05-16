(defmodule hamming
  (export (distance 2)))

(defun distance (strand1 strand2)
  (if (not (== (length strand1) (length strand2)))
    (error "strands must have the same length")
    (lists:sum
      (lists:zipwith
        (lambda (a b) (if (=:= a b) 0 1))
        strand1
        strand2))))
