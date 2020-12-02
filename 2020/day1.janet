(import util)

(defn part1
  ``find two numbers in input that sum to 2020 and multiply them``
  [input]
  (var x nil)
  (loop [i :in input :until x]
    (loop [j :in input :until x]
      (when (= (+ i j) 2020)
        (set x (* i j)))))
  x)

(defn part2
  ``find three numbers in input that sum to 2020 and multiply them``
  [input]
  (var x nil)
  (loop [i :in input :until x]
    (loop [j :in input :until x]
      (loop [k :in input :until x]
        (when (= (+ i j k) 2020)
          (set x (* i j k))))))
  x)

(defn part1-bsearch
  [input]
  (let [input (sorted input)]
    (var x nil)
    (loop [i :in input :until x]
      (if-let [j (util/bsearch |(- 2020 (+ i $)) input)]
        (set x (* i j))))
    x))

(defn part2-bsearch
  [input]
  (let [input (sorted input)]
  (var x nil)
  (loop [i :in input :until x]
    (loop [j :in input :until x]
      (if-let [k (util/bsearch |(- 2020 (+ i j $)) input)]
        (set x (* i j k)))))
  x))

(defn part1-shorter
  ``find two numbers in input that sum to 2020 and multiply them``
  [input]
  (first (seq [i :in input
               j :in input
                 :when (= 2020 (+ i j))]
              (* i j))))

(defn part2-shorter
  ``find two numbers in input that sum to 2020 and multiply them``
  [input]
  (first (seq [i :in input
               j :in input
               k :in input
                 :when (= 2020 (+ i j k))]
              (* i j k))))

(if (= (in (dyn :args) 0) "day1.janet")
  (let [input (util/read-numbers stdin)]
    (print "part1: " (part1-bsearch input))
    (print "part2: " (part2-bsearch input))))
