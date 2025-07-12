(defmodule all-your-base
  (export (rebase 3)))

(defun rebase
  ((input-base _ _) (when (< input-base 2))
   (error "input base must be >= 2"))
  ((_ _ output-base) (when (< output-base 2))
   (error "output base must be >= 2"))
  ((_ '() _) '(0))
  ((input-base digits output-base)
   (cond
     ((lists:any (lambda (d) (or (< d 0) (>= d input-base))) digits)
      (error "all digits must satisfy 0 <= d < input base"))
     ('true
      (let* ((decimal (to-decimal input-base digits))
             (result (to-base output-base decimal)))
        result)))))

(defun to-decimal
  ((input-base digits)
   (lists:foldl (lambda (digit acc) (+ (* acc input-base) digit)) 0 digits)))

(defun to-base
  ((output-base 0) '(0))
  ((output-base decimal)
   (to-base-helper output-base decimal '())))

(defun to-base-helper
  ((output-base 0 '()) '(0))
  ((output-base 0 acc) acc)
  ((output-base decimal acc)
   (let ((digit (rem decimal output-base))
         (quotient (div decimal output-base)))
     (to-base-helper output-base quotient (cons digit acc)))))
