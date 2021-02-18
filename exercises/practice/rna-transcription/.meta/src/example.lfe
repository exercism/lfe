(defmodule rna-transcription
  (export (to-rna 1)))

(defun to-rna (strand) (lists:map #'transcribe-to-rna/1 strand))

(defun transcribe-to-rna
  ([#\G] #\C)
  ([#\C] #\G)
  ([#\T] #\A)
  ([#\A] #\U))
