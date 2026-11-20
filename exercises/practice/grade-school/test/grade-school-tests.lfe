(defmodule grade-school-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(defun roster (school)
  (lc ((<- `#(,_ ,students) (grade-school:sort school))
       (<- student students))
    student))

(deftest roster-is-empty-when-no-student-is-added
  (is-equal '()
            (roster (grade-school:new))))

(deftest add-a-student
  (is-equal '(#(2 ("Aimee")))
            (grade-school:add "Aimee" 2 (grade-school:new))))

(deftest student-is-added-to-the-roster
  (is-equal '("Aimee")
            (clj:->> (grade-school:new)
              (grade-school:add "Aimee" 2)
              (roster))))

(deftest adding-multiple-students-in-the-same-grade-in-the-roster
  (is-equal '(#(2 ("Blair" "James" "Paul")))
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "Paul" 2)
              (grade-school:sort))))

(deftest multiple-students-in-the-same-grade-are-added-to-the-roster
  (is-equal '("Blair" "James" "Paul")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "Paul" 2)
              (roster))))

(deftest cannot-add-student-to-same-grade-in-the-roster-more-than-once
  (is-equal '(#(2 ("Blair" "James" "Paul")))
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 2)
              (grade-school:add "Paul" 2)
              (grade-school:sort))))

(deftest student-not-added-to-same-grade-in-the-roster-more-than-once
  (is-equal '("Blair" "James" "Paul")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 2)
              (grade-school:add "Paul" 2)
              (roster))))

(deftest adding-students-in-multiple-grades
  (is-equal '(#(3 ("Chelsea")) #(7 ("Logan")))
            (clj:->> (grade-school:new)
              (grade-school:add "Chelsea" 3)
              (grade-school:add "Logan" 7)
              (grade-school:sort))))

(deftest students-in-multiple-grades-are-added-to-the-roster
  (is-equal '("Chelsea" "Logan")
            (clj:->> (grade-school:new)
              (grade-school:add "Chelsea" 3)
              (grade-school:add "Logan" 7)
              (roster))))

(deftest cannot-add-same-student-to-multiple-grades-in-the-roster
  (is-equal '(#(2 ("Blair" "James")) #(3 ("Paul")))
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 3)
              (grade-school:add "Paul" 3)
              (grade-school:sort))))

(deftest student-not-added-to-multiple-grades-in-the-roster
  (is-equal '("Blair" "James" "Paul")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 3)
              (grade-school:add "Paul" 3)
              (roster))))

(deftest students-are-sorted-by-grades-in-the-roster
  (is-equal '("Anna" "Peter" "Jim")
            (clj:->> (grade-school:new)
              (grade-school:add "Jim" 3)
              (grade-school:add "Peter" 2)
              (grade-school:add "Anna" 1)
              (roster))))

(deftest students-are-sorted-by-name-in-the-roster
  (is-equal '("Alex" "Peter" "Zoe")
            (clj:->> (grade-school:new)
              (grade-school:add "Peter" 2)
              (grade-school:add "Zoe" 2)
              (grade-school:add "Alex" 2)
              (roster))))

(deftest students-are-sorted-by-grades-and-then-by-name-in-the-roster
  (is-equal '("Anna" "Barb" "Charlie" "Alex" "Peter" "Zoe" "Jim")
            (clj:->> (grade-school:new)
              (grade-school:add "Peter" 2)
              (grade-school:add "Anna" 1)
              (grade-school:add "Barb" 1)
              (grade-school:add "Zoe" 2)
              (grade-school:add "Alex" 2)
              (grade-school:add "Jim" 3)
              (grade-school:add "Charlie" 1)
              (roster))))

(deftest grade-is-empty-if-no-students-in-the-roster
  (is-equal '()
            (grade-school:get 1 (grade-school:new))))

(deftest grade-is-empty-if-no-students-in-that-grade
  (is-equal '()
            (clj:->> (grade-school:new)
              (grade-school:add "Peter" 2)
              (grade-school:add "Zoe" 2)
              (grade-school:add "Alex" 2)
              (grade-school:add "Jim" 3)
              (grade-school:get 1))))

(deftest student-not-added-to-same-grade-more-than-once
  (is-equal '("Blair" "James" "Paul")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 2)
              (grade-school:add "Paul" 2)
              (grade-school:get 2))))

(deftest student-not-added-to-multiple-grades
  (is-equal '("Blair" "James")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 3)
              (grade-school:add "Paul" 3)
              (grade-school:get 2))))

(deftest student-not-added-to-other-grade-for-multiple-grades
  (is-equal '("Paul")
            (clj:->> (grade-school:new)
              (grade-school:add "Blair" 2)
              (grade-school:add "James" 2)
              (grade-school:add "James" 3)
              (grade-school:add "Paul" 3)
              (grade-school:get 3))))

(deftest students-are-sorted-by-name-in-a-grade
  (is-equal '("Bradley" "Franklin")
            (clj:->> (grade-school:new)
              (grade-school:add "Franklin" 5)
              (grade-school:add "Bradley" 5)
              (grade-school:add "Jeff" 1)
              (grade-school:get 5))))
