(defmodule difference-of-squares
  (export (square-of-sums 1)
          (sum-of-squares 1)))

(defun square (x) (trunc (math:pow x 2)))

(defun square-of-sums (x) (square (lists:sum (lists:seq 1 x))))

;; Traverses the list only once.
(defun sum-of-squares (x)
  (lists:foldl
    (lambda (x sum)
      (+ (square x) sum))
    0
    (lists:seq 1 x)))

;; Unnecessarily traverses the list twice, though maybe easier to read.
;; (defun sum-of-squares (x)
;;   (lists:sum (lists:map #'square/1 (lists:seq 1 x))))
