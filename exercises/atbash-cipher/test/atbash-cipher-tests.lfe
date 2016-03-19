(defmodule atbash-cipher-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest encode-yes
  (is-equal "bvh" (atbash-cipher:encode "yes")))

(deftest encode-no
  (is-equal "ml" (atbash-cipher:encode "no")))

(deftest encode-OMG
  (is-equal "lnt" (atbash-cipher:encode "OMG")))

(deftest encode-spaces
  (is-equal "lnt" (atbash-cipher:encode "O M G")))

(deftest encode-mindblowingly
  (is-equal "nrmwy oldrm tob" (atbash-cipher:encode "mindblowingly")))

(deftest encode-numbers
  (is-equal "gvhgr mt123 gvhgr mt"
            (atbash-cipher:encode "Testing, 1 2 3, testing.")))

(deftest encode-deep-thought
  (is-equal "gifgs rhurx grlm" (atbash-cipher:encode "Truth is fiction.")))

(deftest encode-all-the-letters
  (let ((plain-text  "The quick brown fox jumps over the lazy dog.")
        (cipher-text "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
    (is-equal cipher-text (atbash-cipher:encode plain-text))))

(deftest decode-exercism
  (is-equal "exercism" (atbash-cipher:decode "vcvix rhn")))

(deftest decode-a-sentence
  (is-equal "anobstacleisoftenasteppingstone"
            (atbash-cipher:decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v")))

(deftest decode-numbers
  (is-equal "testing123testing"
            (atbash-cipher:decode "gvhgr mt123 gvhgr mt")))

(deftest decode-all-the-letters
  (is-equal "thequickbrownfoxjumpsoverthelazydog"
            (atbash-cipher:decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")))
