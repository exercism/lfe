(defmodule clock-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest create
  (clock:create 0 0)
  (lists:map
    (match-lambda
      ([`#(,hour ,minutes)]
       (is-exception 'error 'function_clause (clock:create hour minutes))))
    '(#(-1 0)
      #(0 -1)
      #(24 0)
      #(0 60))))

(deftest to-string
  (lists:map
    (match-lambda
      ([`#(,string #(,hour ,minutes))]
       (is-equal string (clock:to-string (clock:create hour minutes)))))
    '(#("00:00" #(0 0))
      #("00:01" #(0 1))
      #("01:00" #(1 0))
      #("23:59" #(23 59)))))

(deftest is-equal
  (let ((clock-1 (clock:create 1 0))
        (clock-2 (clock:create 1 0)))
    (is (clock:equal? clock-1 clock-2))))

(deftest minutes-add
  (let* ((clock-1 (clock:create 1 0))
         (clock-2 (clock:minutes-add clock-1 10)))
    (is-equal "01:10" (clock:to-string clock-2))
    (let ((clock-3 (clock:minutes-add clock-1 (+ (* 4 60) 50))))
      (is-equal "05:50" (clock:to-string clock-3))
      (let* ((clock-4 (clock:create 23 59))
             (clock-5 (clock:minutes-add clock-4 1)))
        (is-equal "00:00" (clock:to-string clock-5))))))

(deftest minutes-delete
  (let* ((clock-1 (clock:create 1 0))
         (clock-2 (clock:minutes-delete clock-1 10)))
    (is-equal "00:50" (clock:to-string clock-2))
    (let ((clock-3 (clock:minutes-delete clock-1 (+ (* 4 60) 50))))
      (is-equal "20:10" (clock:to-string clock-3)))))
