(defmodule two-fer-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-name-given
  (is-equal "One for you, one for me." (two-fer:two-fer "")))

(deftest a-name-given
  (is-equal "One for Alice, one for me." (two-fer:two-fer "Alice")))

(deftest another-name-given
  (is-equal "One for Bob, one for me." (two-fer:two-fer "Bob")))
