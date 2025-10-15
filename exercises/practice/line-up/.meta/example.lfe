(defmodule line-up
  (export (format 2)))

(defun format (name number)
  (++ name
      ", you are the "
      (integer_to_list number)
      (suffix-for number)
      " customer we serve today. Thank you!"))

(defun suffix-for (number)
  (suffix-helper (rem number 100) (rem number 10)))

(defun suffix-helper
  ((11 _) "th")
  ((12 _) "th")
  ((13 _) "th")
  ((_ 1) "st")
  ((_ 2) "nd")
  ((_ 3) "rd")
  ((_ _) "th"))
