(defmodule meetup-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftestgen teenth
  (check 'teenth '([#(5 13) #(8 19) #( 9 16)]
                   [#(3 19) #(4 16) #( 8 13)]
                   [#(1 16) #(2 13) #( 6 19)]
                   [#(5 16) #(6 13) #( 9 19)]
                   [#(4 19) #(8 16) #( 9 13)]
                   [#(2 16) #(4 13) #(10 19)]
                   [#(5 19) #(6 16) #(10 13)])))

(deftestgen first
  (check 'first '([#( 3 4) #( 4 1)]
                  [#( 5 7) #( 6 4)]
                  [#( 7 3) #( 8 7)]
                  [#( 9 5) #(10 3)]
                  [#(11 1) #(12 6)]
                  [#( 1 5) #( 2 2)]
                  [#( 3 3) #( 4 7)])))

(deftestgen second
  (check 'second '([#( 3 11) #( 4  8)]
                   [#( 5 14) #( 6 11)]
                   [#( 7 10) #( 8 14)]
                   [#( 9 12) #(10 10)]
                   [#(11  8) #(12 13)]
                   [#( 1 12) #( 2  9)]
                   [#( 3 10) #( 4 14)])))

(deftestgen third
  (check 'third '([#( 3 18) #( 4 15)]
                  [#( 5 21) #( 6 18)]
                  [#( 7 17) #( 8 21)]
                  [#( 9 19) #(10 17)]
                  [#(11 15) #(12 20)]
                  [#( 1 19) #( 2 16)]
                  [#( 3 17) #( 4 21)])))

(deftestgen fourth
  (check 'fourth '([#( 3 25) #( 4 22)]
                   [#( 5 28) #( 6 25)]
                   [#( 7 24) #( 8 28)]
                   [#( 9 26) #(10 24)]
                   [#(11 22) #(12 27)]
                   [#( 1 26) #( 2 23)]
                   [#( 3 24) #( 4 28)])))

(deftestgen last
  (check 'last '([#( 3 25) #( 4 29)]
                 [#( 5 28) #( 6 25)]
                 [#( 7 31) #( 8 28)]
                 [#( 9 26) #(10 31)]
                 [#(11 29) #(12 27)]
                 [#( 1 26) #( 2 23)]
                 [#( 3 31) #( 4 28)])))

(defun check (schedule month-days-list)
  (lists:zipwith (lambda (weekday month-days) (check weekday schedule month-days))
                 (weekdays) month-days-list))

(defun check (weekday schedule month-days)
  (lc ((<- `#(,month ,day) month-days))
    `#(,(++ (portmanteau weekday schedule) " of " (month-name month) " 2013")
       ,(_assertEqual `#(2013 ,month ,day)
                      (meetup:schedule 2013 month weekday schedule)))))

(defun portmanteau
  ([weekday 'teenth]  (++ (-- (atom_to_list weekday) "day") "teenth"))
  ([weekday schedule] (lists:concat `[,schedule " " ,weekday])))

(defun month-name (month)
  (lists:nth month '["january"   "february" "march"     "april"
                     "may"       "june"     "july"      "august"
                     "september" "october"  "novemeber" "december"]))

(defun weekdays () '[monday tuesday wednesday thursday friday saturday sunday])
