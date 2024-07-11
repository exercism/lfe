(defmodule pascals-triangle-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest zero-rows
  (is-equal '() (pascals-triangle:rows 0)))

(deftest single-row
  (is-equal '((1)) (pascals-triangle:rows 1)))

(deftest two-rows
  (is-equal '((1)
              (1 1))
            (pascals-triangle:rows 2)))

(deftest three-rows
  (is-equal '((1)
              (1 1)
              (1 2 1))
            (pascals-triangle:rows 3)))

(deftest four-rows
  (is-equal '((1)
              (1 1)
              (1 2 1)
              (1 3 3 1))
            (pascals-triangle:rows 4)))

(deftest five-rows
  (is-equal '((1)
              (1 1)
              (1 2 1)
              (1 3 3 1)
              (1 4 6 4 1))
            (pascals-triangle:rows 5)))

(deftest six-rows
  (is-equal '((1)
              (1 1)
              (1 2 1)
              (1 3 3 1)
              (1 4 6 4 1)
              (1 5 10 10 5 1))
            (pascals-triangle:rows 6)))

(deftest ten-rows
  (is-equal '((1)
              (1 1)
              (1 2 1)
              (1 3 3 1)
              (1 4 6 4 1)
              (1 5 10 10 5 1)
              (1 6 15 20 15 6 1)
              (1 7 21 35 35 21 7 1)
              (1 8 28 56 70 56 28 8 1)
              (1 9 36 84 126 126 84 36 9 1))
            (pascals-triangle:rows 10)))

