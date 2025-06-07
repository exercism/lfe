(defmodule acronym
    (export (abbreviate 1)))

(defun upper (char)
  (string:to_upper char))

(defun upper? (char)
  (=/= 'nomatch (re:run (list char) "\\p{Lu}")))

(defun break?
  ((#\ ) 'true)
  ((#\-) 'true)
  ((_) 'false))

(defun abbreviate
  (((cons c1 (cons c2 cs)))
   (cond
     ((and (upper? c1) (upper? c2))
      (abbreviate (cons c1 cs)))
     ((upper? c1)
      (cons c1 (abbreviate (cons c2 cs))))
     ((break? c1)
      (abbreviate (cons (upper c2) cs)))
     ('true
      (abbreviate (cons c2 cs)))))
  ((_) ()))
