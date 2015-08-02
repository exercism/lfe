(defmodule atbash-cipher-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest encode-all
  (is-equal (lists:seq #\z #\a -1) (atbash-cipher:encode (lists:seq #\a #\z))))

(deftest decode-all
  (is-equal (lists:seq #\z #\a -1) (atbash-cipher:decode (lists:seq #\a #\z))))

(deftest encode-all-caps
  (is-equal (lists:seq #\Z #\A -1) (atbash-cipher:encode (lists:seq #\A #\Z))))

(deftest decode-all-caps
  (is-equal (lists:seq #\Z #\A -1) (atbash-cipher:decode (lists:seq #\A #\Z))))

(deftest examples-encode
  (is-equal "gvhg" (atbash-cipher:encode "test")))

(deftest examples-decode
  (is-equal "test" (atbash-cipher:decode "gvhg")))

(deftest encode-decode
  (let ((str "The quick brown fox jumps over the lazy dog."))
    (is-equal str (atbash-cipher:decode (atbash-cipher:encode str)))))

(deftest alphanumeric-encode
  (is-equal "gvhg: 1, 2, 3." (atbash-cipher:encode "test: 1, 2, 3.")))

(deftest alphanumeric-decode
  (is-equal "test: 1, 2, 3." (atbash-cipher:encode "gvhg: 1, 2, 3.")))
