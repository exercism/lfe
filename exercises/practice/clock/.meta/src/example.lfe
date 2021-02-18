(defmodule clock
  (export (create 2)
          (equal? 2)
          (minutes-add 2)
          (minutes-delete 2)
          (to-string 1)))

(defun day-minutes () (* 24 60))

(defun hour-minutes->minutes ([`#(,hour ,minutes)] (+ (* 60 hour) minutes)))

(defun minutes->hour-minutes (minutes)
  (let ((minutes* (rem minutes (day-minutes))))
    `#(,(div minutes* 60) ,(rem minutes* 60))))

(defun create
  ([hour minutes] (when (andalso (=< 0 hour)    (< hour 24)
                                 (=< 0 minutes) (< minutes 60)))
   `#(,hour ,minutes)))

(defun equal? (clock-1 clock-2) (=:= clock-1 clock-2))

(defun minutes-add (clock minutes)
  (let ((total-minutes (rem (+ (hour-minutes->minutes clock)
                               minutes)
                            (day-minutes))))
    (minutes->hour-minutes total-minutes)))

(defun minutes-delete (clock minutes)
  (let ((total-minutes (rem (- (+ (hour-minutes->minutes clock)
                                  (day-minutes))
                               minutes)
                            (day-minutes))))
    (minutes->hour-minutes total-minutes)))

(defun to-string
  ([`#(,hour ,minutes)]
   (lists:flatten (io_lib:format "~2.10.0b:~2.10.0b" `(,hour ,minutes)))))
