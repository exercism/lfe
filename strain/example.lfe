(defmodule strain
  (export (keep 2)
          (discard 2)))

(defun keep
  ([_f []] '())
  ([f (cons h t)]
   (if (funcall f h)
     (cons h (keep f t))
     (keep f t))))

;;; Could also be written as a list comprehension:
;;
;; (defun keep' (f lst)
;;   (lc ((<- x lst)
;;        (funcall f x))
;;     x))

(defun discard (f lst) (keep (lambda (x) (not (funcall f x))) lst))
