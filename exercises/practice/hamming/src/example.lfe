(defmodule hamming
  (export (distance 2)))

(defun distance (strand-x strand-y)
  (lists:sum
    (lists:zipwith
      (lambda (x y) (if (=:= x y) 0 1))
      strand-x strand-y)))
