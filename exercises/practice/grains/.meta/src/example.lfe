(defmodule grains
  (export (square 1)
          (total 0)))

(defun 1- (n) (- n 1))

(defun 2^ (x) (trunc (math:pow 2 x)))

(defun square (n) (trunc (2^ (1- n))))

(defun total () (1- (square 65)))

;;; Naive, recursive approach
;;
;; (defun square (n) (square n 1))
;;
;; (defun square
;;   ([1 acc] acc)
;;   ([n acc] (square (- n 1) (* acc 2))))
;;
;; (defun total ()
;;   (lists:foldl
;;     (lambda (x acc)
;;       (+ (square x) acc))
;;     0
;;     (lists:seq 1 64)))
