(defmodule etl-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest transform-one-value
  (erl-transform '(#("a" [1])) '(#(1 "a"))))

(deftest transform-one-word
  (erl-transform '(#("hello" ["WORLD"])) '(#("world" "hello"))))

(deftest transform-more-values
  (erl-transform
    '(#("hello" ["WORLD" "GSCHOOLERS"]))
    '(#("gschoolers" "hello") #("world" "hello"))))

(deftest transform-multiple-keys-from-one-value
  (erl-transform '(#("a" [1]) #("b" [1])) '(#(1 "ab"))))

(deftest transform-multiple-keys-from-multiple-values
  (erl-transform '(#("a" [1]) #("b" [4])) '(#(1 "a") #(4 "b"))))

(deftest transform-more-keys
  (let ((old      '(#("a" ["APPLE" "ARTICHOKE"])
                    #("b" ["BOAT" "BALLERINA"])))
        (expected '(#("apple"     "a")
                    #("artichoke" "a")
                    #("ballerina" "b")
                    #("boat"      "b"))))
    (erl-transform old expected)))

(deftest transform-full-dataset
  (let ((old      '(#(1  ["A" "E" "I" "O" "U" "L" "N" "R" "S" "T"])
                    #(2  ["D" "G"])
                    #(3  ["B" "C" "M" "P"])
                    #(4  ["F" "H" "V" "W" "Y"])
                    #(5  ["K"])
                    #(8  ["J" "X"])
                    #(10 ["Q" "Z"])))
        (expected '(#("a"  1) #("b"  3) #("c" 3) #("d" 2) #("e" 1)
                    #("f"  4) #("g"  2) #("h" 4) #("i" 1) #("j" 8)
                    #("k"  5) #("l"  1) #("m" 3) #("n" 1) #("o" 1)
                    #("p"  3) #("q" 10) #("r" 1) #("s" 1) #("t" 1)
                    #("u"  1) #("v"  4) #("w" 4) #("x" 8) #("y" 4)
                    #("z" 10))))
    (erl-transform old expected)))

(defun erl-transform (old expected) (is-equal expected (etl:transform old)))
