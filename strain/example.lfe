(defmodule strain
  (export (keep 2)
          (discard 2)))

(defun keep
  ([_f []] '())
  ([f (cons h t)]
   (case (funcall f h)
     ('true (cons h (keep f t)))
     (_     (keep f t)))))

;; (defun keep' (f lst)
;;   (lc ((<- x lst)
;;        (funcall f x))
;;     x))

(defun discard (f lst)
  (keep (lambda (x) (not (funcall f x))) lst))
