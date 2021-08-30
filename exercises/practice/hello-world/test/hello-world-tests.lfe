(defmodule hello-world-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest hello-world
  (is-equal "Hello, World!" (hello-world:hello-world)))
