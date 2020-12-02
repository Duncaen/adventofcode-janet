(use day1)

(let [input [1721 979 366 299 675 1456]]
  (assert (= (part1 input) 514579))
  (assert (= (part1-bsearch input) 514579))
  (assert (= (part1-shorter input) 514579)))

(let [input [1721 979 366 299 675 1456]]
  (assert (= (part2 input) 241861950))
  (assert (= (part2-bsearch input) 241861950))
  (assert (= (part2-shorter input) 241861950)))
