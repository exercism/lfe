(defmodule accumulate-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest accumulate-squares
  (let ((f   (lambda (n) (* n n)))
        (lst '(1 2 3)))
    (is-equal '(1 4 9) (accumulate:accumulate f lst))))

(deftest accumulate-upcases
  (let ((f   (lambda (word) (string:to_upper word)))
        (lst (string:tokens "hello world" " ")))
    (is-equal '("HELLO" "WORLD") (accumulate:accumulate f lst))))

(deftest accumulate-reversed-strings
  (let ((f   (lambda (word) (lists:reverse word)))
        (lst (string:tokens "the quick brown fox etc" " ")))
    (is-equal '("eht" "kciuq" "nworb" "xof" "cte")
              (accumulate:accumulate f lst))))

(deftest accumulate-recursively
  (let* ((chars (string:tokens "a b c" " "))
         (nums  (string:tokens "1 2 3" " "))
         (f     (lambda (char) (list-comp ((<- num nums)) (++ char num)))))
    (is-equal '(("a1" "a2" "a3") ("b1" "b2" "b3") ("c1" "c2" "c3"))
              (accumulate:accumulate f chars))))
