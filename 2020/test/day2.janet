(use ../day2)
(def in
 ``
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
 ``)
(def res @[@[1 3 "a" "abcde"]
           @[1 3 "b" "cdefg"]
           @[2 9 "c" "ccccccccc"]])

(assert (deep= (peg/match grammar in) res) "failed to parse input")
(assert (= (part1 res) 2) "failed to count valid passwords for part1")
(assert (= (part2 res) 1) "failed to count valid passwords for part2")
