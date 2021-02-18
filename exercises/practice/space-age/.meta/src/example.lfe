(defmodule space-age
  (export (age-on 2)))

(defun age-on (planet seconds) (/ seconds (seconds-per-year planet)))

(defun seconds-per-year
  (['earth]   (* 365.25 24 60 60))
  (['mercury] (seconds-per-year 0.2408467))
  (['venus]   (seconds-per-year 0.61519726))
  (['mars]    (seconds-per-year 1.8808158))
  (['jupiter] (seconds-per-year 11.862615))
  (['saturn]  (seconds-per-year 29.447498))
  (['uranus]  (seconds-per-year 84.016846))
  (['neptune] (seconds-per-year 164.79132))
  ([n]        (* n (seconds-per-year 'earth))))
