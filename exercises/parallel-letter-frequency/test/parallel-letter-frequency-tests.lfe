(defmodule parallel-letter-frequency-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest single
  (let ((frequencies (parallel-letter-frequency:dict '["asd"])))
    (is-equal (lists:sort (dict:to_list frequencies))
              '[#(#\a 1) #(#\d 1) #(#\s 1)])))

(deftest double
  (let ((frequencies (parallel-letter-frequency:dict '["asd" "asd"])))
    (is-equal (lists:sort (dict:to_list frequencies))
              '[#(#\a 2) #(#\d 2) #(#\s 2)])))
