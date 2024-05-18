(defmodule secret-handshake-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest wink-for-1
  (is-equal '("wink") (secret-handshake:commands 1)))

(deftest double-blink-for-10
  (is-equal '("double blink") (secret-handshake:commands 2)))

(deftest close-your-eyes-for-100
  (is-equal '("close your eyes") (secret-handshake:commands 4)))

(deftest jump-for-1000
  (is-equal '("jump") (secret-handshake:commands 8)))

(deftest combine-two-actions
  (is-equal '("wink" "double blink") (secret-handshake:commands 3)))

(deftest reverse-two-actions
  (is-equal '("double blink" "wink") (secret-handshake:commands 19)))

(deftest reverse-one-action-gives-the-same-action
  (is-equal '("jump") (secret-handshake:commands 24)))
  
(deftest reverse-no-actions-still-gives-no-actions
  (is-equal '() (secret-handshake:commands 16)))

(deftest all-possible-actions
  (is-equal '("wink" "double blink" "close your eyes" "jump") (secret-handshake:commands 15)))

(deftest reverse-all-possible-actions
  (is-equal '("jump" "close your eyes" "double blink" "wink") (secret-handshake:commands 31)))

(deftest do-nothing-for-zero
  (is-equal '() (secret-handshake:commands 0)))
