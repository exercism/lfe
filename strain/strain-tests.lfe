(defmodule strain-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-keep
  (is-equal '() (strain:keep #'under-10?/1 '())))

(deftest keep-everything
  (is-equal '(1 2 3) (strain:keep #'under-10?/1 '(1 2 3))))

(deftest keep-first-last
  (is-equal '(1 3) (strain:keep #'odd?/1 '(1 2 3))))

(deftest keep-nothing
  (is-equal '() (strain:keep #'even?/1 '(1 3 5 7))))

(deftest keep-neither-first-nor-last
  (is-equal '(2) (strain:keep #'even?/1 '(1 2 3))))

(deftest keep-strings
  (let ((strs '("apple" "zebra" "banana" "zombies" "cherimoya" "zealot")))
    (is-equal '("zebra" "zombies" "zealot")
              (strain:keep #'starts-with-z?/1 strs))))

(deftest empty-discard
  (is-equal '() (strain:discard #'under-10?/1 '())))

(deftest discard-everything
  (is-equal '() (strain:discard #'under-10?/1 '(1 2 3))))

(deftest discard-first-and-last
  (is-equal '(2) (strain:discard #'odd?/1 '(1 2 3))))

(deftest discard-nothing
  (is-equal '(1 3 5 7) (strain:discard #'even?/1 '(1 3 5 7))))

(deftest discard-neither-first-nor-last
  (is-equal '(1 3) (strain:discard #'even?/1 '(1 2 3))))

(deftest discard-strings
  (let ((strs '("apple" "zebra" "banana" "zombies" "cherimoya" "zealot")))
    (is-equal '("apple" "banana" "cherimoya")
              (strain:discard #'starts-with-z?/1 strs))))

(defun even? (n) (=:= (rem n 2) 0))

(defun odd? (n) (> (rem n 2) 0))

(defun starts-with-z? (str) (=:= (string:sub_string str 1 1) "z"))

(defun under-10? (n) (< n 10))
