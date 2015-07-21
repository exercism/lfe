(defmodule rna-transcription-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest transcribes-cytidine-unchanged
  (is-equal "C" (rna-transcription:to-rna "G")))

(deftest transcribes-guanosine-unchanged
  (is-equal "G" (rna-transcription:to-rna "C")))

(deftest transcribes-adenosine-unchanged
  (is-equal "A" (rna-transcription:to-rna "T")))

(deftest transcribes-thymidine-to-uracil
  (is-equal "U" (rna-transcription:to-rna "A")))

(deftest transcribes-all-occurences
  (is-equal "UGCACCAGAAUU" (rna-transcription:to-rna "ACGTGGTCTTAA")))
