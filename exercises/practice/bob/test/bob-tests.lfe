(defmodule bob-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest stating-something
  (bob-responds "Tom-ay-to, tom-aaaah-to."
                "Whatever."))

(deftest shouting
  (bob-responds "WATCH OUT!"
                "Whoa, chill out!"))

(deftest shouting-gibberish
  (bob-responds "FCECDFCAAB"
                "Whoa, chill out!"))

(deftest asking-a-question
  (bob-responds "Does this cryogenic chamber make me look fat?"
                "Sure."))

(deftest asking-a-numeric-question
  (bob-responds "You are, what, like 15?"
                "Sure."))

(deftest asking-gibberish
  (bob-responds "fffbbcbeab?"
                "Sure."))

(deftest talking-forcefully
  (bob-responds "Hi there!"
                "Whatever."))

(deftest using-acronyms-in-regular-speech
  (bob-responds "It's OK if you don't want to go work for NASA."
                "Whatever."))

(deftest forceful-question
  (bob-responds "WHAT'S GOING ON?"
                "Calm down, I know what I'm doing!"))

(deftest shouting-numbers
  (bob-responds "1, 2, 3 GO!"
                "Whoa, chill out!"))

(deftest no-letters
  (bob-responds "1, 2, 3"
                "Whatever."))

(deftest question-with-no-letters
  (bob-responds "4?"
                "Sure."))

(deftest shouting-with-special-characters
  (bob-responds "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
                "Whoa, chill out!"))

(deftest shouting-with-no-exclamation-mark
  (bob-responds "I HATE THE DENTIST"
                "Whoa, chill out!"))

(deftest statement-containing-question-mark
  (bob-responds "Ending with ? means a question."
                "Whatever."))

(deftest non-letters-with-question
  (bob-responds ":) ?"
                "Sure."))

(deftest prattling-on
  (bob-responds "Wait! Hang on. Are you going to be OK?"
                "Sure."))

(deftest silence
  (bob-responds ""
                "Fine. Be that way!"))

(deftest prolonged-silence
  (bob-responds "          "
                "Fine. Be that way!"))

(deftest alternate-silence
  (bob-responds "\t\t\t\t\t\t\t\t\t\t"
                "Fine. Be that way!"))

(deftest multiple-line-question
  (bob-responds "\nDoes this cryogenic chamber make\n me look fat?"
                "Sure."))

(deftest starting-with-whitespace
  (bob-responds "         hmmmmmmm..."
                "Whatever."))

(deftest ending-with-whitespace
  (bob-responds "Okay if like my  spacebar  quite a bit?   "
                "Sure."))

(deftest other-whitespace
  (bob-responds "\n\r \t"
                "Fine. Be that way!"))

(deftest non-question-ending-with-whitespace
  (bob-responds "This is a statement ending with whitespace      "
                "Whatever."))

(defun bob-responds (question answer)
  (is-equal answer (bob:response-for question)))
