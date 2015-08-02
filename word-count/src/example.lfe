(defmodule word-count
  (export (count 1)))

(defun count (string)
  (lists:foldl
    (lambda (k acc)
      (dict:update_counter k 1 acc))
    (dict:new)
    (tokenize (string:to_lower string))))

(defun alnum? (char) (orelse (=< #\a char #\z) (=< #\0 char #\9)))

(defun sep? (char) (not (alnum? char)))

(defun tokenize
  (['()] '())
  ([string]
   (case (lists:splitwith #'alnum?/1 (lists:dropwhile #'sep?/1 string))
     (`#([] ,rest)    (tokenize rest))
     (`#(,word ,rest) (cons word (tokenize rest))))))
