(defmodule word-count-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

;; dict should be used to implement word-count:count/1.

(defun assert-count (string expected)
  (is-equal
    (orddict:from_list expected)
    (orddict:from_list (dict:to_list (word-count:count string)))))

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

(deftest handles-cramped-lists
  (assert-count
    "one,two,three"
    '(#("one" 1)
      #("two" 1)
      #("three" 1))))

(deftest handles-expanded-lists
  (assert-count
    "one,\ntwo,\nthree"
    '(#("one" 1)
      #("two" 1)
      #("three" 1))))

(deftest ignore-punctuation
  (assert-count
    "car: carpet as java: javascript!!&@$%^&"
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
    "go Go GO Stop stop"
    '(#("go" 3)
      #("stop" 2))))

(deftest with-apostrophes
  (assert-count
    "First don't laugh. then: don't cry. You're getting it."
    '(#("first" 1)
      #("don't" 2)
      #("laugh" 1)
      #("then" 1)
      #("cry" 1)
      #("you're" 1)
      #("getting" 1)
      #("it" 1))))

(deftest with-quotations
  (assert-count
    "Joe can't tell between 'large' and large."
    '(#("joe" 1)
      #("can't" 1)
      #("tell" 1)
      #("between" 1)
      #("large" 2)
      #("and" 1))))

(deftest substrings-from-the-beginning
  (assert-count
    "Joe can't tell between app, apple and a."
    '(#("joe" 1)
      #("can't" 1)
      #("tell" 1)
      #("between" 1)
      #("app" 1)
      #("apple" 1)
      #("and" 1)
      #("a" 1))))

(deftest multiple-spaces-not-detected-as-a-word
  (assert-count
    " multiple   whitespaces"
    '(#("multiple" 1)
      #("whitespaces" 1))))

(deftest alternating-word-separators-not-detected-as-a-word
  (assert-count
    ",\n,one,\n ,two \n 'three'"
    '(#("one" 1)
      #("two" 1)
      #("three" 1))))

(deftest quotation-for-word-with-apostrophe
  (assert-count
    "can, can't, 'can't'"
    '(#("can" 1)
      #("can't" 2))))
