(defmodule phone
  (export (area-code 1)
          (number 1)
          (pprint 1)))

(defun zeros () "0000000000")

(defun strip-one
  (((cons 49 tail)) tail)
  (((cons _h _t))   (zeros)))

(defun parts (str)
  (let* ((number     (number str))
         (area-code  (string:sub_string number 1 3))
         (exchange   (string:sub_string number 4 6))
         (subscriber (string:sub_string number 7 10)))
    `#(,area-code ,exchange ,subscriber)))

(defun area-code (str)
  (let (((tuple area-code _ _) (parts str)))
    area-code))

(defun number (str)
  (let ((digits (re:replace str "\\D" "" `(global #(return list)))))
    (case (length digits)
      (10 digits)
      (11 (strip-one digits))
      (_  (zeros)))))

(defun pprint (str)
  (let (((tuple area-code exchange subscriber) (parts str)))
    (lists:flatten
      (io_lib:format "\(~s\) ~s-~s" `(,area-code ,exchange ,subscriber)))))
