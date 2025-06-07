(defmodule phone-number
  (export (clean 1)))

(defun clean (value)
  (let* ((digits (re:replace value "\\D" "" `(global #(return list))))
         (cleaned (case (length digits)
                        (10 digits)
                        (11 (string:slice digits 1))
                        (_  'false)))
         (start-area-code (if (== 'false cleaned)
                              ""
                              (lists:sublist cleaned 1 1)))
         (start-exchange-code (if (== 'false cleaned)
                                  "" 
                                  (lists:sublist cleaned 4 1))))
    (cond ((=:= 'false cleaned)
             'false)
          ((string:equal "0" start-area-code)
            'false)
          ((string:equal "1" start-area-code)
            'false)
          ((string:equal "0" start-exchange-code)
            'false)
          ((string:equal "1" start-exchange-code)
            'false)
          ('true
            cleaned))))
