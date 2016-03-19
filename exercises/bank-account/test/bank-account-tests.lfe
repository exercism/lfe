(defmodule bank-account-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest create
  (let ((account (bank-account:create)))
    (is-equal 0 (bank-account:balance account))))

(deftest close-account
  (let ((account (bank-account:create)))
    (bank-account:deposit account 1)
    (is-equal 1 (bank-account:close account))
    (is-error 'function_clause (bank-account:balance account))))

(deftest deposit
  (let ((account (bank-account:create)))
    (bank-account:deposit account 1)
    (is-equal 1 (bank-account:balance account))))

(deftest deposit-fail
  (let ((account (bank-account:create)))
    (bank-account:deposit account -1)
    (is-equal 0 (bank-account:balance account))))

(deftest deposit-many
  (let* ((account (bank-account:create))
         (first   (progn (handle-all 'deposit account (lists:seq 1 10))
                         (bank-account:balance account)))
         (last    (progn (timer:sleep 100)
                         (bank-account:balance account))))
    (is (< first 55))
    (is-equal 55 last)))

(deftest withdraw
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:withdraw account 1))))
    (is-equal 1 amount)
    (is-equal 9 (bank-account:balance account))))

(deftest withdraw-fail
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:withdraw account -1))))
    (is-equal 0 amount)
    (is-equal 10 (bank-account:balance account))))

(deftest withdraw-excessive
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:withdraw account 20))))
    (is-equal 10 amount)
    (is-equal 0 (bank-account:balance account))))

(deftest withdraw-many
  (let* ((account (bank-account:create))
         (first   (progn (bank-account:deposit account 55)
                         (handle-all 'withdraw account (lists:seq 1 10))
                         (bank-account:balance account)))
         (last    (progn (timer:sleep 100)
                         (bank-account:balance account))))
    (is (> first 0))
    (is-equal 0 last)))

(deftest charge
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:charge account 2))))
    (is-equal 2 amount)
    (is-equal 8 (bank-account:balance account))))

(deftest charge-fail
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:charge account -2))))
    (is-equal 0 amount)
    (is-equal 10 (bank-account:balance account))))

(deftest charge-excessive
  (let* ((account (bank-account:create))
         (amount  (progn (bank-account:deposit account 10)
                         (bank-account:charge account 20))))
    (is-equal 0 amount)
    (is-equal 10 (bank-account:balance account))))

(deftest charge-many
  (let* ((account (bank-account:create))
         (first   (progn (bank-account:deposit account 55)
                         (dotimes 10 (lambda (_) (bank-account:charge account 10)))
                         (bank-account:balance account)))
         (last    (progn (timer:sleep 100)
                         (bank-account:balance account))))
    (is (> first 0))
    (is-equal 5 last)))

(defun dotimes (times f) (lists:foreach f (lists:seq 1 times)))

(defun handle-all (request account amounts)
  (lists:foreach
    (lambda (amount)
      (spawn (lambda () (call 'bank-account request account amount))))
    amounts))
