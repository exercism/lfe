(defmodule reverse
  (export (string 1)))

(defun string (str)
  (let ((reversed (string:reverse (iolist_to_binary str))))
    (binary_to_list
      (if (is_binary reversed)
          reversed
          (unicode:characters_to_binary reversed)))))
