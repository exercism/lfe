(defmodule acronym-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(defun acronyms_test_ ()
  (lists:map #'make-test/1 (cases)))

(defun make-test
  (((tuple description input expected))
   (tuple description (lambda () (is-equal expected (acronym:abbreviate input))))))
  
(defun cases ()
  (list
   (tuple "basic" "Portable Network Graphics" "PNG")
   (tuple "lowercase words" "Ruby on Rails" "ROR")
   (tuple "punctuation" "First In, First Out" "FIFO")
   (tuple "all caps word" "GNU Image Manipulation Program" "GIMP")
   (tuple "punctuation without whitespace" "Complementary metal-oxide semiconductor" "CMOS")
   (tuple "very long abbreviation" "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me" "ROTFLSHTMDCOALM")
   (tuple "consecutive delimiters" "Something - I made up from thin air" "SIMUFTA")
   (tuple "apostrophes" "Halley's Comet" "HC")
   (tuple "underscore emphasis" "The Road _Not_ Taken" "TRNT")))
