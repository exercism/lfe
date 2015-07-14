(defmodule anagram
  (export (find 2)))

(defun find (word candidates)
  (lists:filter
   ;; #'anagram?/1 is a curried version of #'anagram?/2
   (anagram? (normalize word))
   candidates))

;; A curried version of #'anagram?/2 which returns a lambda that compares a
;; candidate (after normalizing it) to the given normalized word.
(defun anagram? (normed-word)
  (lambda (candidate)
    (anagram? normed-word (normalize candidate))))

(defun anagram?
  ((`#(,word-lowered ,word-sorted) `#(,candidate-lowered ,candidate-sorted))
   (when (andalso (=/= word-lowered candidate-lowered)
                  (=:= word-sorted  candidate-sorted)))
   'true)
  ((_ _)
   'false))

(defun normalize (str)
  (let ((lowered (string:to_lower str)))
    `#(,lowered ,(lists:sort lowered))))
