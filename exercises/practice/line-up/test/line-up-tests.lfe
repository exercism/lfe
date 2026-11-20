(defmodule line-up-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest format-smallest-non-exceptional-ordinal-numeral-4
  (is-equal "Gianna, you are the 4th customer we serve today. Thank you!"
            (line-up:format "Gianna" 4)))

(deftest format-greatest-single-digit-non-exceptional-ordinal-numeral-9
  (is-equal "Maarten, you are the 9th customer we serve today. Thank you!"
            (line-up:format "Maarten" 9)))

(deftest format-non-exceptional-ordinal-numeral-5
  (is-equal "Petronila, you are the 5th customer we serve today. Thank you!"
            (line-up:format "Petronila" 5)))

(deftest format-non-exceptional-ordinal-numeral-6
  (is-equal "Attakullakulla, you are the 6th customer we serve today. Thank you!"
            (line-up:format "Attakullakulla" 6)))

(deftest format-non-exceptional-ordinal-numeral-7
  (is-equal "Kate, you are the 7th customer we serve today. Thank you!"
            (line-up:format "Kate" 7)))

(deftest format-non-exceptional-ordinal-numeral-8
  (is-equal "Maximiliano, you are the 8th customer we serve today. Thank you!"
            (line-up:format "Maximiliano" 8)))

(deftest format-exceptional-ordinal-numeral-1
  (is-equal "Mary, you are the 1st customer we serve today. Thank you!"
            (line-up:format "Mary" 1)))

(deftest format-exceptional-ordinal-numeral-2
  (is-equal "Haruto, you are the 2nd customer we serve today. Thank you!"
            (line-up:format "Haruto" 2)))

(deftest format-exceptional-ordinal-numeral-3
  (is-equal "Henriette, you are the 3rd customer we serve today. Thank you!"
            (line-up:format "Henriette" 3)))

(deftest format-smallest-two-digit-non-exceptional-ordinal-numeral-10
  (is-equal "Alvarez, you are the 10th customer we serve today. Thank you!"
            (line-up:format "Alvarez" 10)))

(deftest format-non-exceptional-ordinal-numeral-11
  (is-equal "Jacqueline, you are the 11th customer we serve today. Thank you!"
            (line-up:format "Jacqueline" 11)))

(deftest format-non-exceptional-ordinal-numeral-12
  (is-equal "Juan, you are the 12th customer we serve today. Thank you!"
            (line-up:format "Juan" 12)))

(deftest format-non-exceptional-ordinal-numeral-13
  (is-equal "Patricia, you are the 13th customer we serve today. Thank you!"
            (line-up:format "Patricia" 13)))

(deftest format-exceptional-ordinal-numeral-21
  (is-equal "Washi, you are the 21st customer we serve today. Thank you!"
            (line-up:format "Washi" 21)))

(deftest format-exceptional-ordinal-numeral-22-ending-in-nd-even-though-it-is-a-multiple-of-11
  (is-equal "Ingrid, you are the 22nd customer we serve today. Thank you!"
            (line-up:format "Ingrid" 22)))

(deftest format-exceptional-ordinal-numeral-33-ending-in-rd-even-though-it-is-a-multiple-of-11
  (is-equal "Mario, you are the 33rd customer we serve today. Thank you!"
            (line-up:format "Mario" 33)))

(deftest format-exceptional-ordinal-numeral-52-ending-in-nd-even-though-it-is-a-multiple-of-13
  (is-equal "Quentin, you are the 52nd customer we serve today. Thank you!"
            (line-up:format "Quentin" 52)))

(deftest format-exceptional-ordinal-numeral-62
  (is-equal "Nayra, you are the 62nd customer we serve today. Thank you!"
            (line-up:format "Nayra" 62)))

(deftest format-non-exceptional-ordinal-numeral-72-ending-in-nd-even-though-it-is-a-multiple-of-12
  (is-equal "Ugo, you are the 72nd customer we serve today. Thank you!"
            (line-up:format "Ugo" 72)))

(deftest format-exceptional-ordinal-numeral-91-ending-in-st-even-though-it-is-a-multiple-of-13
  (is-equal "Boris, you are the 91st customer we serve today. Thank you!"
            (line-up:format "Boris" 91)))

(deftest format-exceptional-ordinal-numeral-100
  (is-equal "John, you are the 100th customer we serve today. Thank you!"
            (line-up:format "John" 100)))

(deftest format-exceptional-ordinal-numeral-101
  (is-equal "Zeinab, you are the 101st customer we serve today. Thank you!"
            (line-up:format "Zeinab" 101)))

(deftest format-non-exceptional-ordinal-numeral-112
  (is-equal "Knud, you are the 112th customer we serve today. Thank you!"
            (line-up:format "Knud" 112)))

(deftest format-exceptional-ordinal-numeral-123
  (is-equal "Yma, you are the 123rd customer we serve today. Thank you!"
            (line-up:format "Yma" 123)))

(deftest format-large-number-972-ending-in-nd-even-though-it-is-a-multiple-of-12
  (is-equal "Elias, you are the 972nd customer we serve today. Thank you!"
            (line-up:format "Elias" 972)))
