(defmodule grade-school
  (export (add 3)
          (get 2)
          (new 0)
          (sort 1)))

(defun add (name grade school)
  (case (get grade school)
    ('() (orddict:store grade `(,name) school))
    (class (orddict:store grade (ordsets:add_element name class) school))))

(defun get (grade students)
  (case (orddict:find grade students)
    (`#(ok ,class) class)
    (_ '())))

(defun new () '())

(defun sort (school) school)
