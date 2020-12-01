(import util)

(defn- part1
  ``find two numbers in input that sum to 2020 and multiply them``
  [input]
  (var nums nil)
  (loop [x :in input :until nums]
    (loop [y :in input :until nums]
      (when (= (+ x y) 2020)
        (set nums [x y]))))
  (* ;nums))

# test
(let [input [1721 979 366 299 675 1456]]
  (assert (= (part1 input) 514579)))

# result
(let [input (util/read-numbers "day1.in")]
  (printf "part1: %d" (part1 input)))

(defn- part2
  ``find three numbers in input that sum to 2020 and multiply them``
  [input]
  (var nums nil)
  (loop [x :in input :until nums]
    (loop [y :in input :until nums]
      (loop [z :in input :until nums]
        (when (= (+ x y z) 2020)
          (set nums [x y z])))))
  (* ;nums))

# test
(let [input [1721 979 366 299 675 1456]]
  (assert (= (part2 input) 241861950)))

# result
(let [input (util/read-numbers "day1.in")]
  (printf "part2: %d" (part2 input)))
