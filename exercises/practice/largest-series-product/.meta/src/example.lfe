(defmodule largest-series-product
  (export (from-string 2)))

(defun from-string
  ([string n]
   (from-string (length string) string n)))

(defun from-string
  ([length string n] (when (>= length n))
   (lists:max (lists:map #'product/1 (sets length n string)))))

(defun product
  ([set]
   (lists:foldl #'product/2 1 set)))

(defun product
  ([c acc] (when (andalso (=< #\0 c) (=< c #\9)))
   (* (- c #\0) acc)))

(defun sets
  ([length width (= (cons _ t) string)] (when (> length width))
   (cons (lists:sublist string width) (sets (- length 1) width t)))
  ([_length _width string]
   `(,string)))
