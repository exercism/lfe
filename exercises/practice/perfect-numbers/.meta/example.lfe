(defmodule perfect-numbers
  (export (classify 1)))

(defun classify (number)
  (if (=< number 0)
      'false
      (let ((sum-of-factors (lists:sum (factors-of number))))
        (label number sum-of-factors))))

(defun factors-of (number)
  (lists:filter (lambda (x) (=:= 0 (rem number x)))
                (lists:seq 1 (div number 2))))

(defun label 
  ((number number)
   'perfect)
  ((number sum) (when (< number sum))
                'abundant)
  ((number sum) (when (> number sum))
                'deficient))
