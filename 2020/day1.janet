(import util)

(defn part1
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


(defn part2
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

(if (= (in (dyn :args) 0) "day1.janet")
  (let [input (util/read-numbers stdin)]
    (print "part1: " (part1 input))
    (print "part2: " (part2 input))))
