(defmodule hello-world-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest hello-world
  (is-equal "Hello, world!" (hello-world:hello-world)))
