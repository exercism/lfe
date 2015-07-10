(defmodule anagram
  (export (find 2)))

(defun find (word candidates)
  (lists:filter
    (is-anagram? (normalize word))
    candidates))

(defun is-anagram?
  (((tuple lowered sorted))
   (lambda (other)
     (let (((tuple lowered* sorted*) (normalize other)))
       (cond ((=:= lowered lowered*) 'false)
             ((=:= sorted sorted*)   'true)
             (else                   'false))))))

(defun normalize (str)
  (let ((lowered (string:to_lower str)))
    `#(,lowered ,(lists:sort lowered))))
