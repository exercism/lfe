(defmodule kindergarten-garden
  (export (plants 2)))

(defun plants (garden student)
  (let ((diagram (parse garden))
        (index (position-of student)))
    (lists:foldl (lambda (row acc)
                  (let ((first-cup (lists:nth index row))
                        (second-cup (lists:nth (+ 1 index) row)))
                    (lists:append acc (list first-cup second-cup))))
                 '()
                 diagram)))

(defun parse (garden)
  (let ((rows (string:split garden "\n"))
        (get-code (lambda (chr) (plant-codes chr))))
    (lists:map (lambda (row) (lists:map get-code row)) rows)))

(defun position-of
  (("Alice") 1)
  (("Bob") 3)
  (("Charlie") 5)
  (("David") 7)
  (("Eve") 9)
  (("Fred") 11)
  (("Ginny") 13)
  (("Harriet") 15)
  (("Ileana") 17)
  (("Joseph") 19)
  (("Kincaid") 21)
  (("Larry") 23))

(defun plant-codes
  ((#\V) "violets")
  ((#\R) "radishes")
  ((#\C) "clover")
  ((#\G) "grass"))
