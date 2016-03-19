(defmodule circular-buffer-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest create
  (let ((pid (circular-buffer:create 5)))
    (is-equal #(ok 5) (circular-buffer:size pid))))

(deftest write-read
  (let ((pid (circular-buffer:create 4)))
    (is-equal #(error empty) (circular-buffer:read pid))
    (circular-buffer:write pid 1)
    (is-equal #(ok 1) (circular-buffer:read pid))))

(deftest write-read-many
  (let ((pid    (circular-buffer:create 3))
        (values '(1 2 3)))
    (write-all pid values)
    (check-reads pid values)))

(deftest over-write-read
  (let ((pid (circular-buffer:create 2)))
    (write-all pid '(1 2 3 4))
    (check-reads pid '(3 4))
    (is-equal #(error empty) (circular-buffer:read pid))))

(deftest write-attempt
  (let* ((pid       (circular-buffer:create 1))
         (attempt-1 (circular-buffer:write-attempt pid 1))
         (attempt-2 (progn (is-equal 'ok attempt-1)
                           (circular-buffer:write-attempt pid 2))))
    (is-equal #(error full) attempt-2)
    (is-equal #(ok 1) (circular-buffer:read pid))))

(deftest producer-consumer
  (let* ((pid       (circular-buffer:create 1))
         (attempt-1 (circular-buffer:write-attempt pid 1))
         (attempt-2 (progn (is-equal 'ok attempt-1)
                           (circular-buffer:write-attempt pid 2))))
    (is-equal #(error full) attempt-2)
    (is-equal #(ok 1) (circular-buffer:read pid))))

(defun check-reads (pid values)
  (lists:foreach
    (lambda (value)
      (is-equal `#(ok ,value) (circular-buffer:read pid)))
    values))

(defun write-all (pid values)
  (lists:foreach
    (lambda (value)
      (circular-buffer:write pid value))
    values))
