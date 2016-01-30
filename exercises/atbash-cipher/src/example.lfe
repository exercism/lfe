(defmodule atbash-cipher
  (export (encode 1) (decode 1)))

(defun encode (str)
  (let ((chunks (split-by 5 (transcode str))))
    (string:join chunks " ")))

(defun decode (str) (transcode str))

(defun transcode (str) (lists:filtermap #'cipher/1 str))

(defun cipher
  ([char] (when (=< #\A char) (=< char #\Z))
   `#(true ,(- #\Z (- char #\a))))
  ([char] (when (=< #\a char) (=< char #\z))
   `#(true ,(- #\z (- char #\a))))
  ([char] (when (=< #\0 char) (=< char #\9))
   `#(true ,char))
  ([_char]
   'false))

;; See: https://github.com/lfex/clj/blob/0.3.0/src/clj-seq.lfe#L151-L160
(defun split-by
  ([0 data] data)
  ([_ '()]  '())
  ([x data] (when (> x (length data)))
   (split-by (length data) data))
  ([x data]
   (cons (lists:sublist data x)
         (split-by x (lists:nthtail x data)))))
