(defmodule word-count
  (export (count 1)))

(defun count (string)
  (lists:foldl
    (lambda (word acc)
      (dict:update_counter word 1 acc))
    (dict:new)
    (tokenize (string:to_lower string))))

(defun unquote
  (((cons #\' remaining))
    (case (lists:last remaining)
      (#\' (lists:sublist remaining 1 (- (length remaining) 1)))
      (_ (cons #\' remaining))))
  ((word) word))

(defun tokenize-loop
  ; End of sentence with no more words
  (('() '() acc) acc)
  ; End of sentence with one more word
  (('() word-acc acc) (cons (unquote (lists:reverse word-acc)) acc))
  ; Lower case character, number or apostrophe
  (((cons char remaining) word-acc acc)
    (when (or (and (>= char #\a) (=< char #\z)) (and (>= char #\0) (=< char #\9)) (== char #\')))
    (tokenize-loop remaining (cons char word-acc) acc))
  ; Boundary or junk with no word in word accumulator (skip it)
  (((cons _ remaining) '() acc) (tokenize-loop remaining '() acc))
  ; Boundary or junk with something in word accumulator (add the word to the accumulator)
  (((cons _ remaining) word-acc acc) (tokenize-loop remaining '() (cons (unquote (lists:reverse word-acc)) acc))))

(defun tokenize (text) (tokenize-loop text '() '()))
