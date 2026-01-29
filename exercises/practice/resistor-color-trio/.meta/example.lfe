(defmodule resistor-color-trio
  (export (label 1)))

(defun label
  (((list* c1 c2 c3 _))
   (let* ((raw-value (+ (* 10 (color-code c1)) (color-code c2)))
          (multiplier (color-code c3))
          (total-value (* raw-value (trunc (math:pow 10 multiplier)))))
     (format-value total-value))))

(defun format-value
  ((val) (when (>= val 1.0e9))
   (lists:flatten (io_lib:format "~p gigaohms" `(,(div val (trunc 1.0e9))))))
  ((val) (when (>= val 1.0e6))
   (lists:flatten (io_lib:format "~p megaohms" `(,(div val (trunc 1.0e6))))))
  ((val) (when (>= val 1.0e3))
   (lists:flatten (io_lib:format "~p kiloohms" `(,(div val (trunc 1.0e3))))))
  ((val)
   (lists:flatten (io_lib:format "~p ohms" `(,val)))))

(defun color-code
  (("black") 0)
  (("brown") 1)
  (("red") 2)
  (("orange") 3)
  (("yellow") 4)
  (("green") 5)
  (("blue") 6)
  (("violet") 7)
  (("grey") 8)
  (("white") 9))
