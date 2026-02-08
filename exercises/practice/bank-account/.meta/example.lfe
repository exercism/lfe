(defmodule bank-account
  (export (balance 1)
          (charge 2)
          (close 1)
          (create 0)
          (deposit 2)
          (open 1)
          (withdraw 2)))

(defun create () 
  (spawn (lambda () (loop 'unopened 0))))

(defun open (pid)
  (! pid `#(open ,(self)))
  (receive
    ('ok 'ok)
    (`#(error ,msg) `#(error ,msg))))

(defun balance (pid)
  (! pid `#(balance ,(self)))
  (receive
    (`#(balance ,amount) amount)
    (`#(error ,msg) `#(error ,msg))))

(defun deposit
  ([pid amount] (when (=< amount 0))
   `#(error "amount must be greater than 0"))
  ([pid amount]
   (! pid `#(deposit ,amount ,(self)))
   (receive
     ('ok 'ok)
     (`#(error ,msg) `#(error ,msg)))))

(defun withdraw
  ([pid amount] (when (=< amount 0))
   `#(error "amount must be greater than 0"))
  ([pid amount]
   (! pid `#(withdraw ,amount ,(self)))
   (receive
     (`#(withdrawn ,amt) amt)
     (`#(error ,msg) `#(error ,msg)))))

(defun close (pid)
  (! pid `#(close ,(self)))
  (receive
    ('ok 'ok)
    (`#(error ,msg) `#(error ,msg))))

(defun charge
  ([pid amount] (when (> amount 0))
   (! pid `#(charge ,amount ,(self)))
   (receive
     (`#(charged ,amt) amt)))
  ([_pid _amount] 0))

(defun loop
  (['unopened balance]
   (receive
     (`#(open ,from)
      (! from 'ok)
      (loop 'open balance))
     (`#(balance ,from)
      (! from `#(error "account not open"))
      (loop 'unopened balance))
     (`#(deposit ,_amount ,from)
      (! from `#(error "account not open"))
      (loop 'unopened balance))
     (`#(withdraw ,_amount ,from)
      (! from `#(error "account not open"))
      (loop 'unopened balance))
     (`#(close ,from)
      (! from `#(error "account not open"))
      (loop 'unopened balance))))
  
  (['open balance]
   (receive
     (`#(open ,from)
      (! from `#(error "account already open"))
      (loop 'open balance))
     (`#(balance ,from)
      (! from `#(balance ,balance))
      (loop 'open balance))
     (`#(deposit ,amount ,from)
      (! from 'ok)
      (loop 'open (+ balance amount)))
     (`#(withdraw ,amount ,from)
      (if (> amount balance)
        (progn
          (! from `#(error "amount must be less than balance"))
          (loop 'open balance))
        (progn
          (! from `#(withdrawn ,amount))
          (loop 'open (- balance amount)))))
     (`#(charge ,amount ,from)
      (let ((charged (if (>= balance amount) amount 0)))
        (! from `#(charged ,charged))
        (loop 'open (- balance charged))))
     (`#(close ,from)
      (! from 'ok)
      (loop 'closed balance))))
  
  (['closed balance]
   (receive
     (`#(open ,from)
      (! from 'ok)
      (loop 'open 0))
     (`#(balance ,from)
      (! from `#(error "account not open"))
      (loop 'closed balance))
     (`#(deposit ,_amount ,from)
      (! from `#(error "account not open"))
      (loop 'closed balance))
     (`#(withdraw ,_amount ,from)
      (! from `#(error "account not open"))
      (loop 'closed balance))
     (`#(close ,from)
      (! from `#(error "account not open"))
      (loop 'closed balance)))))
