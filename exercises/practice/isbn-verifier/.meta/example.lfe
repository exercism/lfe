(defmodule isbn-verifier
  (export (valid? 1)))

(defun valid? (isbn)
  (let ((chars (remove-dashes isbn)))
    (case (length chars)
      (10 (and (valid-chars? chars)
               (valid-checksum? chars)))
      (_ 'false))))

(defun remove-dashes (isbn)
  (lists:filter (lambda (char) (/= char #\-)) isbn))

(defun valid-chars? (chars)
  (let* (((tuple digits (list check)) (lists:split 9 chars))
         (digit? (lambda (char) (and (=< #\0 char) (=< char #\9)))))
    (and (lists:all digit? digits)
         (or (funcall digit? check)
             (== check #\X)))))

(defun valid-checksum? (chars)
  (== (rem (weighted-sum chars) 11) 0))

(defun weighted-sum (chars)
  (weighted-sum chars 10 0))

(defun weighted-sum
  (('() _ sum) sum)
  (((cons char more) weight sum)
   (let ((value (value-of char)))
     (weighted-sum more
                   (- weight 1)
                   (+ sum (* value weight))))))

(defun value-of
  ((#\X) 10)
  ((char) (- char #\0)))
