(defmodule grade-school-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest add-student
  (let* ((school   (grade-school:add "Aimee" 2 (grade-school:new)))
         (students (grade-school:get 2 school)))
    (is-equal '("Aimee") (lists:sort students))))

(deftest add-more-students-in-same-class
  (let* ((school   (grade-school:add "James" 2 (grade-school:new)))
         (school   (grade-school:add "Blair" 2 school))
         (school   (grade-school:add "Paul"  2 school))
         (students (grade-school:get 2 school)))
    (is-equal '("Blair" "James" "Paul") (lists:sort students))))

(deftest add-students-to-different-grades
  (let* ((school (grade-school:add "Chelsea" 3 (grade-school:new)))
         (school (grade-school:add "Logan"   7 school)))
    (is-equal '("Chelsea") (grade-school:get 3 school))
    (is-equal '("Logan")   (grade-school:get 7 school))))

(deftest get-students-in-a-grade
  (let* ((school   (grade-school:add "Franklin" 5 (grade-school:new)))
         (school   (grade-school:add "Bradley"  5 school))
         (school   (grade-school:add "Jeff"     1 school))
         (students (grade-school:get 5 school)))
    (is-equal '("Bradley" "Franklin") (lists:sort students))))

(deftest get-students-in-a-non-existent-grade
  (is-equal () (grade-school:get 1 (grade-school:new))))

(deftest sort-school
  (let* ((school (grade-school:add "Jennifer"    4 (grade-school:new)))
         (school (grade-school:add "Kareem"      6 school))
         (school (grade-school:add "Christopher" 4 school))
         (school (grade-school:add "Kyle"        3 school))
         (sorted '(#(3 ("Kyle"))
                   #(4 ("Christopher" "Jennifer"))
                   #(6 ("Kareem")))))
    (is-equal sorted (grade-school:sort school))))
