(defmodule gigasecond
  (export (from 1)))

(defun gigasecond () 1000000000)

(defun from
  ([`#(,year ,month ,day)]
   (from `#(#(,year ,month ,day) #(0 0 0))))
  ([datetime]
   (let ((seconds (calendar:datetime_to_gregorian_seconds datetime)))
     (calendar:gregorian_seconds_to_datetime (+ seconds (gigasecond))))))
