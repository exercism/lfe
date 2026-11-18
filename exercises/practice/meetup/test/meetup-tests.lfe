(defmodule meetup-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest when-teenth-monday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 5 13)
            (meetup:schedule 2013 5 'monday 'teenth)))

(deftest when-teenth-monday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 8 19)
            (meetup:schedule 2013 8 'monday 'teenth)))

(deftest when-teenth-monday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 9 16)
            (meetup:schedule 2013 9 'monday 'teenth)))

(deftest when-teenth-tuesday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 3 19)
            (meetup:schedule 2013 3 'tuesday 'teenth)))

(deftest when-teenth-tuesday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 4 16)
            (meetup:schedule 2013 4 'tuesday 'teenth)))

(deftest when-teenth-tuesday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 8 13)
            (meetup:schedule 2013 8 'tuesday 'teenth)))

(deftest when-teenth-wednesday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 1 16)
            (meetup:schedule 2013 1 'wednesday 'teenth)))

(deftest when-teenth-wednesday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 2 13)
            (meetup:schedule 2013 2 'wednesday 'teenth)))

(deftest when-teenth-wednesday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 6 19)
            (meetup:schedule 2013 6 'wednesday 'teenth)))

(deftest when-teenth-thursday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 5 16)
            (meetup:schedule 2013 5 'thursday 'teenth)))

(deftest when-teenth-thursday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 6 13)
            (meetup:schedule 2013 6 'thursday 'teenth)))

(deftest when-teenth-thursday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 9 19)
            (meetup:schedule 2013 9 'thursday 'teenth)))

(deftest when-teenth-friday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 4 19)
            (meetup:schedule 2013 4 'friday 'teenth)))

(deftest when-teenth-friday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 8 16)
            (meetup:schedule 2013 8 'friday 'teenth)))

(deftest when-teenth-friday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 9 13)
            (meetup:schedule 2013 9 'friday 'teenth)))

(deftest when-teenth-saturday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 2 16)
            (meetup:schedule 2013 2 'saturday 'teenth)))

(deftest when-teenth-saturday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 4 13)
            (meetup:schedule 2013 4 'saturday 'teenth)))

(deftest when-teenth-saturday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 10 19)
            (meetup:schedule 2013 10 'saturday 'teenth)))

(deftest when-teenth-sunday-is-the-19th-the-last-day-of-the-teenth-week
  (is-equal #(2013 5 19)
            (meetup:schedule 2013 5 'sunday 'teenth)))

(deftest when-teenth-sunday-is-some-day-in-the-middle-of-the-teenth-week
  (is-equal #(2013 6 16)
            (meetup:schedule 2013 6 'sunday 'teenth)))

(deftest when-teenth-sunday-is-the-13th-the-first-day-of-the-teenth-week
  (is-equal #(2013 10 13)
            (meetup:schedule 2013 10 'sunday 'teenth)))

(deftest when-first-monday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 3 4)
            (meetup:schedule 2013 3 'monday 'first)))

(deftest when-first-monday-is-the-1st-the-first-day-of-the-first-week
  (is-equal #(2013 4 1)
            (meetup:schedule 2013 4 'monday 'first)))

(deftest when-first-tuesday-is-the-7th-the-last-day-of-the-first-week
  (is-equal #(2013 5 7)
            (meetup:schedule 2013 5 'tuesday 'first)))

(deftest when-first-tuesday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 6 4)
            (meetup:schedule 2013 6 'tuesday 'first)))

(deftest when-first-wednesday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 7 3)
            (meetup:schedule 2013 7 'wednesday 'first)))

(deftest when-first-wednesday-is-the-7th-the-last-day-of-the-first-week
  (is-equal #(2013 8 7)
            (meetup:schedule 2013 8 'wednesday 'first)))

(deftest when-first-thursday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 9 5)
            (meetup:schedule 2013 9 'thursday 'first)))

(deftest when-first-thursday-is-another-day-in-the-middle-of-the-first-week
  (is-equal #(2013 10 3)
            (meetup:schedule 2013 10 'thursday 'first)))

(deftest when-first-friday-is-the-1st-the-first-day-of-the-first-week
  (is-equal #(2013 11 1)
            (meetup:schedule 2013 11 'friday 'first)))

(deftest when-first-friday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 12 6)
            (meetup:schedule 2013 12 'friday 'first)))

(deftest when-first-saturday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 1 5)
            (meetup:schedule 2013 1 'saturday 'first)))

(deftest when-first-saturday-is-another-day-in-the-middle-of-the-first-week
  (is-equal #(2013 2 2)
            (meetup:schedule 2013 2 'saturday 'first)))

(deftest when-first-sunday-is-some-day-in-the-middle-of-the-first-week
  (is-equal #(2013 3 3)
            (meetup:schedule 2013 3 'sunday 'first)))

(deftest when-first-sunday-is-the-7th-the-last-day-of-the-first-week
  (is-equal #(2013 4 7)
            (meetup:schedule 2013 4 'sunday 'first)))

(deftest when-second-monday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 3 11)
            (meetup:schedule 2013 3 'monday 'second)))

(deftest when-second-monday-is-the-8th-the-first-day-of-the-second-week
  (is-equal #(2013 4 8)
            (meetup:schedule 2013 4 'monday 'second)))

(deftest when-second-tuesday-is-the-14th-the-last-day-of-the-second-week
  (is-equal #(2013 5 14)
            (meetup:schedule 2013 5 'tuesday 'second)))

(deftest when-second-tuesday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 6 11)
            (meetup:schedule 2013 6 'tuesday 'second)))

(deftest when-second-wednesday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 7 10)
            (meetup:schedule 2013 7 'wednesday 'second)))

(deftest when-second-wednesday-is-the-14th-the-last-day-of-the-second-week
  (is-equal #(2013 8 14)
            (meetup:schedule 2013 8 'wednesday 'second)))

(deftest when-second-thursday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 9 12)
            (meetup:schedule 2013 9 'thursday 'second)))

(deftest when-second-thursday-is-another-day-in-the-middle-of-the-second-week
  (is-equal #(2013 10 10)
            (meetup:schedule 2013 10 'thursday 'second)))

(deftest when-second-friday-is-the-8th-the-first-day-of-the-second-week
  (is-equal #(2013 11 8)
            (meetup:schedule 2013 11 'friday 'second)))

(deftest when-second-friday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 12 13)
            (meetup:schedule 2013 12 'friday 'second)))

(deftest when-second-saturday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 1 12)
            (meetup:schedule 2013 1 'saturday 'second)))

(deftest when-second-saturday-is-another-day-in-the-middle-of-the-second-week
  (is-equal #(2013 2 9)
            (meetup:schedule 2013 2 'saturday 'second)))

(deftest when-second-sunday-is-some-day-in-the-middle-of-the-second-week
  (is-equal #(2013 3 10)
            (meetup:schedule 2013 3 'sunday 'second)))

(deftest when-second-sunday-is-the-14th-the-last-day-of-the-second-week
  (is-equal #(2013 4 14)
            (meetup:schedule 2013 4 'sunday 'second)))

(deftest when-third-monday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 3 18)
            (meetup:schedule 2013 3 'monday 'third)))

(deftest when-third-monday-is-the-15th-the-first-day-of-the-third-week
  (is-equal #(2013 4 15)
            (meetup:schedule 2013 4 'monday 'third)))

(deftest when-third-tuesday-is-the-21st-the-last-day-of-the-third-week
  (is-equal #(2013 5 21)
            (meetup:schedule 2013 5 'tuesday 'third)))

(deftest when-third-tuesday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 6 18)
            (meetup:schedule 2013 6 'tuesday 'third)))

(deftest when-third-wednesday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 7 17)
            (meetup:schedule 2013 7 'wednesday 'third)))

(deftest when-third-wednesday-is-the-21st-the-last-day-of-the-third-week
  (is-equal #(2013 8 21)
            (meetup:schedule 2013 8 'wednesday 'third)))

(deftest when-third-thursday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 9 19)
            (meetup:schedule 2013 9 'thursday 'third)))

(deftest when-third-thursday-is-another-day-in-the-middle-of-the-third-week
  (is-equal #(2013 10 17)
            (meetup:schedule 2013 10 'thursday 'third)))

(deftest when-third-friday-is-the-15th-the-first-day-of-the-third-week
  (is-equal #(2013 11 15)
            (meetup:schedule 2013 11 'friday 'third)))

(deftest when-third-friday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 12 20)
            (meetup:schedule 2013 12 'friday 'third)))

(deftest when-third-saturday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 1 19)
            (meetup:schedule 2013 1 'saturday 'third)))

(deftest when-third-saturday-is-another-day-in-the-middle-of-the-third-week
  (is-equal #(2013 2 16)
            (meetup:schedule 2013 2 'saturday 'third)))

(deftest when-third-sunday-is-some-day-in-the-middle-of-the-third-week
  (is-equal #(2013 3 17)
            (meetup:schedule 2013 3 'sunday 'third)))

(deftest when-third-sunday-is-the-21st-the-last-day-of-the-third-week
  (is-equal #(2013 4 21)
            (meetup:schedule 2013 4 'sunday 'third)))

(deftest when-fourth-monday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 3 25)
            (meetup:schedule 2013 3 'monday 'fourth)))

(deftest when-fourth-monday-is-the-22nd-the-first-day-of-the-fourth-week
  (is-equal #(2013 4 22)
            (meetup:schedule 2013 4 'monday 'fourth)))

(deftest when-fourth-tuesday-is-the-28th-the-last-day-of-the-fourth-week
  (is-equal #(2013 5 28)
            (meetup:schedule 2013 5 'tuesday 'fourth)))

(deftest when-fourth-tuesday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 6 25)
            (meetup:schedule 2013 6 'tuesday 'fourth)))

(deftest when-fourth-wednesday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 7 24)
            (meetup:schedule 2013 7 'wednesday 'fourth)))

(deftest when-fourth-wednesday-is-the-28th-the-last-day-of-the-fourth-week
  (is-equal #(2013 8 28)
            (meetup:schedule 2013 8 'wednesday 'fourth)))

(deftest when-fourth-thursday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 9 26)
            (meetup:schedule 2013 9 'thursday 'fourth)))

(deftest when-fourth-thursday-is-another-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 10 24)
            (meetup:schedule 2013 10 'thursday 'fourth)))

(deftest when-fourth-friday-is-the-22nd-the-first-day-of-the-fourth-week
  (is-equal #(2013 11 22)
            (meetup:schedule 2013 11 'friday 'fourth)))

(deftest when-fourth-friday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 12 27)
            (meetup:schedule 2013 12 'friday 'fourth)))

(deftest when-fourth-saturday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 1 26)
            (meetup:schedule 2013 1 'saturday 'fourth)))

(deftest when-fourth-saturday-is-another-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 2 23)
            (meetup:schedule 2013 2 'saturday 'fourth)))

(deftest when-fourth-sunday-is-some-day-in-the-middle-of-the-fourth-week
  (is-equal #(2013 3 24)
            (meetup:schedule 2013 3 'sunday 'fourth)))

(deftest when-fourth-sunday-is-the-28th-the-last-day-of-the-fourth-week
  (is-equal #(2013 4 28)
            (meetup:schedule 2013 4 'sunday 'fourth)))

(deftest last-monday-in-a-month-with-four-mondays
  (is-equal #(2013 3 25)
            (meetup:schedule 2013 3 'monday 'last)))

(deftest last-monday-in-a-month-with-five-mondays
  (is-equal #(2013 4 29)
            (meetup:schedule 2013 4 'monday 'last)))

(deftest last-tuesday-in-a-month-with-four-tuesdays
  (is-equal #(2013 5 28)
            (meetup:schedule 2013 5 'tuesday 'last)))

(deftest last-tuesday-in-another-month-with-four-tuesdays
  (is-equal #(2013 6 25)
            (meetup:schedule 2013 6 'tuesday 'last)))

(deftest last-wednesday-in-a-month-with-five-wednesdays
  (is-equal #(2013 7 31)
            (meetup:schedule 2013 7 'wednesday 'last)))

(deftest last-wednesday-in-a-month-with-four-wednesdays
  (is-equal #(2013 8 28)
            (meetup:schedule 2013 8 'wednesday 'last)))

(deftest last-thursday-in-a-month-with-four-thursdays
  (is-equal #(2013 9 26)
            (meetup:schedule 2013 9 'thursday 'last)))

(deftest last-thursday-in-a-month-with-five-thursdays
  (is-equal #(2013 10 31)
            (meetup:schedule 2013 10 'thursday 'last)))

(deftest last-friday-in-a-month-with-five-fridays
  (is-equal #(2013 11 29)
            (meetup:schedule 2013 11 'friday 'last)))

(deftest last-friday-in-a-month-with-four-fridays
  (is-equal #(2013 12 27)
            (meetup:schedule 2013 12 'friday 'last)))

(deftest last-saturday-in-a-month-with-four-saturdays
  (is-equal #(2013 1 26)
            (meetup:schedule 2013 1 'saturday 'last)))

(deftest last-saturday-in-another-month-with-four-saturdays
  (is-equal #(2013 2 23)
            (meetup:schedule 2013 2 'saturday 'last)))

(deftest last-sunday-in-a-month-with-five-sundays
  (is-equal #(2013 3 31)
            (meetup:schedule 2013 3 'sunday 'last)))

(deftest last-sunday-in-a-month-with-four-sundays
  (is-equal #(2013 4 28)
            (meetup:schedule 2013 4 'sunday 'last)))

(deftest when-last-wednesday-in-february-in-a-leap-year-is-the-29th
  (is-equal #(2012 2 29)
            (meetup:schedule 2012 2 'wednesday 'last)))

(deftest last-wednesday-in-december-that-is-also-the-last-day-of-the-year
  (is-equal #(2014 12 31)
            (meetup:schedule 2014 12 'wednesday 'last)))

(deftest when-last-sunday-in-february-in-a-non-leap-year-is-not-the-29th
  (is-equal #(2015 2 22)
            (meetup:schedule 2015 2 'sunday 'last)))

(deftest when-first-friday-is-the-7th-the-last-day-of-the-first-week
  (is-equal #(2012 12 7)
            (meetup:schedule 2012 12 'friday 'first)))
