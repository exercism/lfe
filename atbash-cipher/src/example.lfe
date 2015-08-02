(defmodule atbash-cipher
  (export (decode 1)
          (encode 1)))

(defun decode (str) (transcode str))

(defun encode (str) (transcode str))

(defun transcode (str) (lists:map #'cipher/1 str))

(defun cipher
  ([char] (when (andalso (=< #\A char) (=< char #\Z)))
   (- #\Z (- char #\A)))
  ([char] (when (andalso (=< #\a char) (=< char #\z)))
   (- #\z (- char #\a)))
  ([char]
   char))
