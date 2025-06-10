(defmodule luhn
  (export (valid? 1))
)

(defun valid? (number)
  (case (checksum (lists:reverse number) 0 0)
    ((tuple 'ok count total) (when (> count 1)) (== (rem total 10) 0))
    (_ 'false)
  )
)

(defun checksum
  (('() count total) (tuple 'ok count total))
  (((cons 32 reversed-number) count total) (checksum reversed-number count total))
  (((cons h reversed-number) count total)
    (when (=< #\0 h) (=< h #\9))
    (checksum reversed-number
      (+ count 1)
      (+ total (number-to-add count (- h #\0)))
    )
  )
  ((_ count total) (tuple 'invalid count total))
)

(defun number-to-add
  ((count digit) (when (== (rem count 2) 0)) digit)
  ((_ digit) (when (< digit 5)) (* digit 2))
  ((_ digit) (- (* digit 2) 9))
)
