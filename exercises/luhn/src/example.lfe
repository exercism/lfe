(defmodule luhn
  (export (valid? 1)
          (create 1)
          (checksum 1)))

(defun valid? (number) (== (rem (checksum number) 10) 0))

(defun create (number)
  (lists:flatten `(,number ,(- #\: (rem (checksum (++ number "0")) 10)))))

(defun checksum (number)
  (checksum
    (lists:reverse
      (lists:filter
        (lambda (c)
          (=< #\0 c #\9))
        number))
    'odd
    0))

(defun checksum
  (['() _ total] total)
  ([(cons h reversed-number) 'odd total]
   (checksum reversed-number 'even (- (+ total h) #\0)))
  ([(cons h reversed-number) 'even total] (when (< h #\5))
   (checksum reversed-number 'odd (+ total (* (- h #\0) 2))))
  ([(cons h reversed-number) 'even total] (when (>= h #\5))
   (checksum reversed-number 'odd (- (+ total (* (- h #\0) 2)) 9))))
