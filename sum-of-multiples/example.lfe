(defmodule sum-of-multiples
  (export (sum-of-multiples 1)
          (sum-of-multiples 2))
  (import
    (from lists
      (any 2)
      (foldl 3)
      (seq 2))))

(defun sum-of-multiples (n)
  (sum-of-multiples '(3 5) n))

(defun sum-of-multiples (multiples n)
  (foldl (lambda (x sum)
           (case (multiple multiples x)
             ('true (+ sum x))
             ('false sum)))
         0
         (seq 1 (- n 1))))

(defun multiple (lst x)
  (any (lambda (n) (=:= (rem x n) 0)) lst))
