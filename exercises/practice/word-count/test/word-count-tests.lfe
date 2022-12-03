(defmodule word-count-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

;; dict should be used to implement word-count:count/1.

(deftest count-one-word
  (assert-count
    "word"
    '(#("word" 1))))

(deftest count-one-of-each
  (assert-count
    "one of each"
    '(#("one"  1)
      #("of"   1)
      #("each" 1))))

(deftest count-multiple-occurrences
  (assert-count
    "one fish two fish red fish blue fish"
    '(#("one"  1)
      #("two"  1)
      #("fish" 4)
      #("red"  1)
      #("blue" 1))))

(deftest ignore-punctuation
  (assert-count
    "car : carpet as java : javascript!!&@$%^&"
    '(#("car"        1)
      #("carpet"     1)
      #("as"         1)
      #("java"       1)
      #("javascript" 1))))

(deftest include-numbers
  (assert-count
    "testing, 1, 2 testing"
    '(#("testing" 2)
      #("1"       1)
      #("2"       1))))

(deftest normalize-case
  (assert-count
    "go Go GO"
    '(#("go"  3))))

(deftest prefix-punctuation
  (assert-count
    "!%%#testing, 1, 2 testing"
    '(#("testing" 2)
      #("1"       1)
      #("2"       1))))

(deftest symbols-are-separators
  (assert-count
    "hey,my_spacebar_is_broken."
    '(#("hey"      1)
      #("my"       1)
      #("spacebar" 1)
      #("is"       1)
      #("broken"   1))))

(defun assert-count (string expected)
  (is-equal
    (orddict:from_list expected)
    (orddict:from_list (dict:to_list (word-count:count string)))))
