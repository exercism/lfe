(defmodule sum-of-multiples
  (export (sum-of-multiples 1)
          (sum-of-multiples 2)))

(defun sum-of-multiples (n)
  (sum-of-multiples '(3 5) n))

(defun sum-of-multiples (multiples n)
  (lists:foldl
    (lambda (x sum)
      (if (multiple multiples x)
        (+ sum x)
        sum))
    0
    (lists:seq 1 (- n 1))))

(defun multiple (lst x)
  (lists:any
    (lambda (n)
      (=:= (rem x n) 0))
    lst))
