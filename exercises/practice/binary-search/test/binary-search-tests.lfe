(defmodule binary-search-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest find-value-in-vector-with-one-element
  (is-equal (binary-search:find #(6) 6) 1))

(deftest find-value-in-middle-of-vector
  (is-equal (binary-search:find #(1 3 4 6 8 9 11)
                                6)
            4))

(deftest find-value-at-beginningd-of-vector
  (is-equal (binary-search:find #(1 3 4 6 8 9 11)
                                1)
            1))

(deftest find-value-at-end-of-vector
  (is-equal (binary-search:find #(1 3 4 6 8 9 11)
                                11)
            7))

(deftest find-value-in-vector-of-odd-length
  (is-equal (binary-search:find #(1 3 5 8 13 21 34 55 89 144 233 377 634)
                                144)
            10))

(deftest find-value-in-vector-of-even-length
  (is-equal (binary-search:find #(1 3 5 8 13 21 34 55 89 144 233 377)
                                21)
            6))

(deftest identifies-value-not-included-in-vector
  (is-not (binary-search:find #(1 3 4 6 8 9 11)
                              7)))

(deftest value-smaller-than-smallest-value-in-vector-not-found
  (is-not (binary-search:find #(1 3 4 6 8 9 11)
                              0)))

(deftest value-larger-than-largest-value-in-vector-not-found
  (is-not (binary-search:find #(1 3 4 6 8 9 11)
                              13)))

(deftest nothing-found-in-empty-vector
  (is-not (binary-search:find #() 1)))

(deftest nothing-found-when-left-and-right-bounds-cross
  (is-not (binary-search:find #(1 2) 0)))
