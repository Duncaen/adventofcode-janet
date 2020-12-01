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

(defn part1-bsearch
  [input]
  (let [input (sorted input)]
    (var x nil)
    (loop [i :in input :until x]
      (if-let [j (util/bsearch |(- (+ i $) 2020) input)]
        (set x (* i j))))
    x))

(defn part2-bsearch
  [input]
  (let [input (sorted input)]
  (var x nil)
  (loop [i :in input :until x]
    (loop [j :in input :until x]
      (if-let [k (util/bsearch |(- (+ i j $) 2020) input)]
        (set x (* i j k)))))
  x))

(if (= (in (dyn :args) 0) "day1.janet")
  (let [input (util/read-numbers stdin)]
    (print "part1: " (part1-bsearch input))
    (print "part2: " (part2-bsearch input))))
