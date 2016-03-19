(defmodule robot-simulator-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest create
  (let ((robot (robot-simulator:create)))
    (is-equal 'undefined (robot-simulator:direction robot))
    (is-equal #(undefined undefined) (robot-simulator:position robot))))

(deftest place
  (let ((robot     (robot-simulator:create))
        (direction 'north)
        (position  #(1 2)))
    (robot-simulator:place robot direction position)
    (is-equal direction (robot-simulator:direction robot))
    (is-equal position (robot-simulator:position robot))))

(defmacro test-direction (turn position directions)
  `(deftest ,turn
     (let ((robot (robot-simulator:create)))
       (robot-simulator:place robot 'north ,position)
       (lists:foreach
         (lambda (direction)
           (funcall (fun robot-simulator ,turn 1) robot)
           (is-equal direction (robot-simulator:direction robot))
           (is-equal ,position (robot-simulator:position robot)))
         ,directions))))

(test-direction left  #(3 4) '(west south east north))
(test-direction right #(5 6) '(east south west north))

(defmacro test-advance (direction start end)
  `(deftest ,(list_to_atom (++ "advance-" (atom_to_list direction)))
     (let ((robot (robot-simulator:create)))
       (robot-simulator:place robot (quote ,direction) ,start)
       (robot-simulator:advance robot)
       (is-equal (quote ,direction) (robot-simulator:direction robot))
       (is-equal ,end (robot-simulator:position robot)))))

(test-advance north #( 7  8) #( 7  9))
(test-advance south #( 9 10) #( 9  9))
(test-advance east  #(11 12) #(12 12))
(test-advance west  #(13 14) #(12 14))

(defmacro test-control (string direction position)
  `(deftest ,(list_to_atom (++ "control-" string))
     (let ((robot (robot-simulator:create)))
       (robot-simulator:place robot 'north #(7 3))
       (robot-simulator:control robot ,string)
       (is-equal (quote ,direction) (robot-simulator:direction robot))
       (is-equal ,position (robot-simulator:position robot)))))

(test-control "RAALAL"  west  #(9 4))
(test-control "unknown" north #(7 3))
