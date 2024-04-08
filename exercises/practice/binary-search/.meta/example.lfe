(defmodule binary-search
  (export (find 2)))

(defun find
  ((#() item)
    'false)
  ((numbers item)
    (do-find numbers
             item
             1
             (tuple_size numbers))))

(defun do-find
  ((_numbers _item low high) (when (< high low))
    'false)
  ((numbers item low high)
    (let* ((middle (div (+ low high) 2))
           (middle-value (element middle numbers)))
      (cond ((< item middle-value) (do-find numbers
                                            item
                                            low
                                            (- middle 1)))
            ((> item middle-value) (do-find numbers
                                            item
                                            (+ middle 1)
                                            high))
            ('true middle)))))
