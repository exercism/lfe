(defmodule gigasecond-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest one
  (is-equal #(#(2043 1 1) #(1 46 40)) (gigasecond:from #(2011 4 25))))

(deftest two
  (is-equal #(#(2009 2 19) #(1 46 40)) (gigasecond:from #(1977 6 13))))

(deftest three
  (is-equal #(#(1991 3 27) #(1 46 40)) (gigasecond:from #(1959 7 19))))

(deftest four-with-seconds
  (is-equal
    #(#(1991 3 28) #(1 46 39))
    (gigasecond:from #(#(1959 7 19) #(23 59 59)))))

;; modify the test to test your 1 Gs anniversary
;; (deftest with-your-birthday
;;   (let ((your-birthday  #(year month day))
;;         (gs-anniversary (gigasecond:from your-birthday)))
;;     (is-equal #(#(2009 1 31) #(1 46 39)) gs-anniversary)))
