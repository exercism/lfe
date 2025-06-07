(defmodule bob
  (export (response-for 1)))

(defun response-for (str)
  (let ((trimmed (string:trim str)))
    (first-match
     trimmed
     `(#(,#'string:is_empty/1 "Fine. Be that way!")
       #(,#'forceful?/1       "Calm down, I know what I'm doing!")
       #(,#'shouting?/1       "Whoa, chill out!")
       #(,#'question?/1       "Sure.")
       #(,(lambda (_) 'true)  "Whatever.")))))

(defun first-match
  ([s (cons `#(,f ,res) fs)]
   (case (funcall f s)
     ('true res)
     ('false (first-match s fs)))))

(defun forceful? (str)
  (andalso (shouting? str)
           (question? str)))

(defun shouting? (str)
  (andalso (has-letters? str)
           (=:= (string:to_upper str) str)
           (=/= (string:to_lower str) str)))

(defun question?
  (('()) 'false)
  ((`(,#\?)) 'true)
  ((`(,_ . ,t)) (question? t)))

(defun has-letters? (str)
  (lists:any #'letter?/1 str))

(defun letter? (char)
  (orelse 
    (andalso (>= char #\A) (=< char #\Z))
    (andalso (>= char #\a) (=< char #\z))))
