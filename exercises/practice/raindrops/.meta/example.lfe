(defmodule raindrops
    (export (convert 1)))

(defun fill-string
  (("" value) (integer_to_list value))
  ((content _value) content)
)

(defun check-sound 
  ((word 0) word)
  ((_word _value) "")
)

(defun convert 
  ((value)
    (fill-string 
      (lists:concat
        (list
          (check-sound "Pling" (rem value 3))
          (check-sound "Plang" (rem value 5))
          (check-sound "Plong" (rem value 7))
        )
      )
      value
    )
  )
)
