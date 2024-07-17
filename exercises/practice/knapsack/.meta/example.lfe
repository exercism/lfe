(defmodule knapsack
  (export (maximum-value 2)))

(include-lib "include/item.lfe")

(defun find-max
    (item last-values capacity)
        (let*
            ((value-without (lists:nth (+ capacity 1) last-values))
             (weight-value (item-weight item))
             (value-value (item-value item))
             (left-over-capacity (- capacity weight-value)))
            (if
                (< left-over-capacity 0)
                value-without
                (let
                    ((value-with
                        (+
                            (lists:nth (+ left-over-capacity 1) last-values)
                            value-value)))
                    (if (> value-with value-without) value-with value-without)))))

(defun next-values
    ([item last-values -1 acc] acc)
    ([item last-values capacity acc]
        (next-values
            item
            last-values
            (- capacity 1)
            (cons (find-max item last-values capacity) acc))))

(defun do-maximum-values
    (['() last-values capacity] (lists:last last-values))
    ([(cons item remaining) last-values capacity]
        (do-maximum-values
            remaining
            (next-values item last-values capacity '())
            capacity)))

(defun maximum-value
    (('() _capacity) 0)
    ((items capacity)
        (do-maximum-values
            items
            (lists:duplicate
                (+ capacity 1)
                0)
            capacity)))
