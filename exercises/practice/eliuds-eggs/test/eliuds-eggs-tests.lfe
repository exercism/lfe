(defmodule eliuds-eggs-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest zero-eggs
  (is-equal (eliuds-eggs:egg-count 0) 0))

(deftest one-egg
  (is-equal (eliuds-eggs:egg-count 16) 1))

(deftest four-eggs
  (is-equal (eliuds-eggs:egg-count 89) 4))

(deftest thirteen-eggs
  (is-equal (eliuds-eggs:egg-count 2000000000) 13))
