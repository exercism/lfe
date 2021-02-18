(defmodule parallel-letter-frequency
  (export (dict 1)))

(defun dict (strings)
  (let ((pid (spawn #'loop/0)))
    (lists:foreach (lambda (string) (! pid `#(string ,string))) strings)
    (! pid `#(done ,(self))))
  (receive (freqs freqs)))

(defun loop () (loop (dict:new)))

(defun loop (freqs)
  (receive
    (`#(string ,string) (loop (lists:foldl #'frequency/2 freqs string)))
    (`#(done   ,from)   (! from freqs))))

(defun frequency (char freqs) (dict:update_counter char 1 freqs))
