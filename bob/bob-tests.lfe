(defmodule bob-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest responds-to-something
  (bob-responds "Tom-ay-to, tom-aaaah-to." "Whatever."))

(deftest responds-to-shouts
  (bob-responds "WATCH OUT!" "Whoa, chill out!"))

(deftest responds-to-questions
  (bob-responds "Does this cryogenic chamber make me look fat?" "Sure."))

(deftest responds-to-forceful-talking
  (bob-responds "Let's go make out behind the gym!" "Whatever."))

(deftest responds-to-acronyms
  (bob-responds "It's OK if you don't want to go the DMV." "Whatever."))

(deftest responds-to-forceful-questions
  (bob-responds "WHAT THE HELL WERE YOU THINKING?" "Whoa, chill out!"))

(deftest responds-to-shouting-with-special-characters
  (bob-responds "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
                "Whoa, chill out!"))

(deftest responds-to-shouting-numbers
  (bob-responds "1, 2, 3, GO!" "Whoa, chill out!"))

(deftest responds-to-shouting-with-no-exclamation-mark
  (bob-responds "I HATE YOU" "Whoa, chill out!"))

(deftest responds-to-statement-containing-question-mark
  (bob-responds "Ending with ? means a question" "Whatever."))

(deftest responds-to-silence
  (bob-responds "" "Fine. Be that way!"))

(deftest responds-to-prolonged-silence
  (bob-responds "    " "Fine. Be that way!"))

(deftest responds-to-non-letters-with-question
  (bob-responds ":) ?" "Sure."))

(deftest responds-to-multiple-line-questions
  (bob-responds "\nDoes this cryogenic chamber make me look fat? \nno"
                "Whatever."))

;; This one is especially challenging in Erlang, hint: use the re module.

;; (deftest responds-to-other-whitespace
;;   (bob-responds "\n\r \t\v\xA0;\x{2002};" "Fine. Be that way!"))

(deftest responds-to-only-numbers
  (bob-responds "1, 2, 3" "Whatever."))

(deftest responds-to-question-with-only-numbers
  (bob-responds "4?" "Sure."))

(deftest responds-to-unicode-shout
  (bob-responds "\xdc;ML\xc4;\xdc;TS!" "Whoa, chill out!"))


(deftest responds-to-unicode-non-shout
  (bob-responds "\xdc;ML\xe4;\xdc;TS!" "Whatever."))

(defun bob-responds (question answer)
  (is-equal answer (bob:response-for question)))
