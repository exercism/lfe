(defmodule gigasecond-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest date-only-specification-of-time
  (is-equal
    #(#(2043 1 1) #(1 46 40))
    (gigasecond:from #(2011 4 25))))

(deftest second-test-for-date-only-specification-of-time
  (is-equal
    #(#(2009 2 19) #(1 46 40))
    (gigasecond:from #(1977 6 13))))

(deftest third-test-for-date-only-specification-of-time
  (is-equal
    #(#(1991 3 27) #(1 46 40))
    (gigasecond:from #(1959 7 19))))

(deftest full-time-specified
  (is-equal
    #(#(2046 10 2) #(23 46 40))
    (gigasecond:from #(#(2015 1 24) #(22 0 0)))))

(deftest full-time-with-day-roll-over
  (is-equal
    #(#(2046 10 3) #(1 46 39))
    (gigasecond:from #(#(2015 1 24) #(23 59 59)))))
