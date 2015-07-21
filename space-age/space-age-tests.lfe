(defmodule space-age-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(defmacro test-earth-and-planet (seconds age-on-earth planet age-on-planet)
  `(deftest ,(list_to_atom (++ "age-in-" (atom_to_list planet) "-years"))
     (is-equal 'true 'true)
     (equal-float? (space-age:age-on 'earth ,seconds) ,age-on-earth)
     (equal-float? (space-age:age-on (quote ,planet) ,seconds) ,age-on-planet)))

(deftest age-in-earth-years
  (equal-float? (space-age:age-on 'earth 1000000000) 31.69))

(test-earth-and-planet 2134835688 67.65 mercury 280.88)

(test-earth-and-planet 189839836 6.02 venus 9.78)

(test-earth-and-planet 2329871239 73.83 mars 39.25)

(test-earth-and-planet 901876382 28.58 jupiter 2.41)

(test-earth-and-planet 3000000000 95.06 saturn 3.23)

(test-earth-and-planet 3210123456 101.72 uranus 1.21)

(test-earth-and-planet 8210123456 260.16 neptune 1.58)

(defun equal-float? (x y) (is-equal y (round x 2)))

(defun round (number precision)
  (let ((p (math:pow 10 precision)))
    (/ (round (* number p)) p)))
