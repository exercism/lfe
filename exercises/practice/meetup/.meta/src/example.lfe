(defmodule meetup
  (doc "Calculating the date of meetups.")
  (export (schedule 4)))

(defun WEEKDAY-MAP ()
  "Days of the week enumerator."
  (map 'monday    1
       'tuesday   2
       'wednesday 3
       'thursday  4
       'friday    5
       'saturday  6
       'sunday    7))

(defun SCHEDULE-MAP ()
  "Enumerator for specifying an occurrence of a weekday in a month."
  (map 'first  0
       'second 1
       'third  2
       'fourth 3
       'teenth 4
       'last   5))

(defun weekday-num (weekday)
  (maps:get weekday (WEEKDAY-MAP)))

(defun schedule-num (schedule)
  (maps:get schedule (SCHEDULE-MAP)))

(defun schedule
  "Given a year, month, and weekday and schedule atoms, return the specified date."
  ([year month weekday 'last]
   (let ((last-day (calendar:last_day_of_the_month year month)))
     (date-in-week weekday `#(,year ,month ,(- last-day 6)))))
  ([year month weekday 'teenth]
   (date-in-week weekday `#(,year ,month 13)))
  ([year month weekday nth]
   (let ((start-day (+ 1 (* 7 (schedule-num nth)))))
     (date-in-week weekday `#(,year ,month ,start-day)))))

(defun date-in-week
  ([weekday (= `#(,_ ,_ ,day) start-date)]
   (date-in-range (weekday-num weekday) start-date (+ day 6))))

(defun date-in-range
  ([day-num (= `#(,year ,month ,day) date) end-day] (when (=< day end-day))
   (if (=:= day-num (calendar:day_of_the_week date))
     date
     (date-in-range day-num `#(,year ,month ,(+ day 1)) end-day))))
