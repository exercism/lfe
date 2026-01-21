(defmodule anagram
  (export (find 2)))

(defun find (word candidates)
  (let ((normed-word (normalize word)))
    (lists:filter
      (lambda (candidate) (anagram? normed-word (normalize candidate)))
      candidates)))

(defun anagram?
  ([`#(,word-lowered ,word-sorted) `#(,candidate-lowered ,candidate-sorted)]
   (when (andalso (=/= word-lowered candidate-lowered)
                  (=:= word-sorted  candidate-sorted)))
   'true)
  ([_ _]
   'false))

(defun normalize (str)
  (let* ((bin (erlang:list_to_binary str))
         (cleaned (unicode:characters_to_list bin))
         (lowered (string:to_lower cleaned)))
    `#(,lowered ,(lists:sort lowered))))
