(defmodule trinary-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftestgen trinary-to-decimal
  (lc ((<- `#(,decimal ,trinary)
           '[#(1 "1") #(2 "2") #(3 "10") #(4 "11") #(9 "100") #(14 "112")
             #(26 "222") #(42 "1120") #(32091 "1122000120") #(0 "carrot")]))
    `#(,(lists:concat `["trinary " ,trinary " is decimal " ,decimal])
       ,(_assertEqual decimal (trinary:to-decimal trinary)))))
