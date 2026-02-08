(defmodule bank-account-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest newly-opened-account-has-zero-balance
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (is-equal 0 (bank-account:balance account))))

(deftest single-deposit
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (is-equal 100 (bank-account:balance account))))

(deftest multiple-deposits
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (bank-account:deposit account 50)
    (is-equal 150 (bank-account:balance account))))

(deftest withdraw-once
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (bank-account:withdraw account 75)
    (is-equal 25 (bank-account:balance account))))

(deftest withdraw-twice
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (bank-account:withdraw account 80)
    (bank-account:withdraw account 20)
    (is-equal 0 (bank-account:balance account))))

(deftest multiple-operations-sequentially
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (bank-account:deposit account 110)
    (bank-account:withdraw account 200)
    (bank-account:deposit account 60)
    (bank-account:withdraw account 50)
    (is-equal 20 (bank-account:balance account))))

(deftest cannot-check-balance-of-closed-account
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:close account)
    (is-equal #(error "account not open") (bank-account:balance account))))
(deftest cannot-deposit-into-closed-account
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:close account)
    (is-equal #(error "account not open") (bank-account:deposit account 50))))

(deftest cannot-deposit-into-unopened-account
  (let ((account (bank-account:create)))
    (is-equal #(error "account not open") (bank-account:deposit account 50))))

(deftest cannot-withdraw-from-closed-account
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:close account)
    (is-equal #(error "account not open") (bank-account:withdraw account 50))))

(deftest cannot-close-unopened-account
  (let ((account (bank-account:create)))
    (is-equal #(error "account not open") (bank-account:close account))))

(deftest cannot-open-already-opened-account
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (is-equal #(error "account already open") (bank-account:open account))))

(deftest reopened-account-does-not-retain-balance
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 50)
    (bank-account:close account)
    (bank-account:open account)
    (is-equal 0 (bank-account:balance account))))

(deftest cannot-withdraw-more-than-deposited
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 25)
    (is-equal #(error "amount must be less than balance") 
              (bank-account:withdraw account 50))))

(deftest cannot-withdraw-negative
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (bank-account:deposit account 100)
    (is-equal #(error "amount must be greater than 0") 
              (bank-account:withdraw account -50))))

(deftest cannot-deposit-negative
  (let ((account (bank-account:create)))
    (bank-account:open account)
    (is-equal #(error "amount must be greater than 0") 
              (bank-account:deposit account -50))))

(deftest can-handle-concurrent-transactions
  (let* ((account (bank-account:create))
         (spawn-deposits (lambda ()
                          (lists:foreach
                            (lambda (_)
                              (spawn (lambda () (bank-account:deposit account 1))))
                            (lists:seq 1 1000))))
         (spawn-withdrawals (lambda ()
                             (lists:foreach
                               (lambda (_)
                                 (spawn (lambda () (bank-account:withdraw account 1))))
                               (lists:seq 1 1000)))))
    (bank-account:open account)
    (funcall spawn-deposits)
    (funcall spawn-withdrawals)
    (timer:sleep 500)
    (is-equal 0 (bank-account:balance account))))
