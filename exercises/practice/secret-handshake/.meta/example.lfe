(defmodule secret-handshake
  (export (commands 1)))

(defun commands (number)
  (let* ((all-digits (integer_to_list number 2))
         (last-five (string:slice (string:reverse all-digits) 0 5)))
        (lists:reverse (retrieve-command last-five 0 '()))))

(defun retrieve-command
    (((cons 49 tail) 0 acc)
        (retrieve-command tail 1 (cons "wink" acc)))
    (((cons 49 tail) 1 acc)
        (retrieve-command tail 2 (cons "double blink" acc)))
    (((cons 49 tail) 2 acc)
        (retrieve-command tail 3 (cons "close your eyes" acc)))
    (((cons 49 tail) 3 acc)
        (retrieve-command tail 4 (cons "jump" acc)))
    (((cons 49 tail) 4 acc)
        (lists:reverse acc))
    (((cons 48 tail) n acc) (when (=< n 4))
        (retrieve-command tail (+ 1 n) acc))
    (('() _ acc)
        acc))
