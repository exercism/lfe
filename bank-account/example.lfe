(defmodule bank-account
  (export (balance 1)
          (charge 2)
          (close 1)
          (create 0)
          (deposit 2)
          (withdraw 2)))

(defun balance (pid) (handle (is_process_alive pid) pid 'balance 0))

(defun charge
  ([pid amount] (when (> amount 0))
   (handle (is_process_alive pid) pid 'charge amount))
  ([_pid _amount] 0))

(defun close (pid) (handle (is_process_alive pid) pid 'close 0))

(defun create () (spawn (lambda () (loop 0))))

(defun deposit
  ([pid amount]   (when (> amount 0)) (! pid `#(deposit ,amount)))
  ([_pid _amount] 'ok))

(defun withdraw
  ([pid amount] (when (> amount 0))
   (handle (is_process_alive pid) pid 'withdraw amount))
  ([_pid _amount] 0))

(defun handle
  (['true pid request argument]
   (! pid `#(,request ,argument ,(self)))
   (receive
     (`#(,request ,answer) answer))))

(defun loop (balance)
  (receive
    (`#(balance ,_argument ,pid)
     (! pid `#(balance, ,balance))
     (loop balance))
    (`#(charge ,amount ,pid)
     (let ((charge (loop-charge balance amount)))
       (! pid `#(charge ,charge))
       (loop (- balance charge))))
    (`#(close ,_argument ,pid)
     (! pid `#(close ,balance)))
    (`#(deposit ,amount)
     (loop (+ balance amount)))
    (`#(withdraw ,amount ,pid)
     (let ((withdrawal (min balance amount)))
       (! pid `#(withdraw ,withdrawal))
       (loop (- balance withdrawal))))))

(defun loop-charge
  ([balance amount]   (when (>= balance amount)) amount)
  ([_balance _amount] 0))
