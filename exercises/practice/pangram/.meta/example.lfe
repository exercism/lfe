(defmodule pangram
  (export (pangram? 1)))

(defun pangram? (sentence)
  (ordsets:is_subset (lists:seq #\a #\z)
                     (ordsets:from_list (string:lowercase sentence))))
