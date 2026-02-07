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
    (`#(string ,string) (loop (process-text string freqs)))
    (`#(done ,from) (! from freqs))))

(defun process-text (string acc)
  (let* ((text-bin (if (is_binary string) string (list_to_binary string)))
         (unicode-list (unicode:characters_to_list text-bin 'utf8))
         (lowered-list (lists:map (fun string:to_lower 1) unicode-list)))
    (lists:foldl #'frequency/2 acc lowered-list)))

(defun frequency (char freqs)
  (if (or (and (>= char 97) (=< char 122)) ; a-z
          (and (>= char 65) (=< char 90)) ; A-Z  
          (>= char 128)) ; Extended unicode
    (dict:update_counter char 1 freqs)
    freqs))
