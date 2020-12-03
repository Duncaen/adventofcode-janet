(def grammar (peg/compile '(some (* (<- (some (set ".#"))) "\n"))))

(defn- trees-in-slope
  [input right down]
  (var x 0)
  (var trees 0)
  (var len (length (in input 0)))
  # (print (in input 0))
  (loop [y :range [down (length input) down]]
    (set x (% (+ x right) len))
    (let [line (in input y)
          tree (= (chr "#") (in line x))]
      # (print
      #   (string/slice line 0 x)
      #   (if tree "X" "O")
      #   (string/slice line (+ x 1)))
      (when tree (++ trees))))
  trees)

(defn- trees-in-slope-shorter
  [input right down]
  (+ ;(seq [y :range [down (length input) down]
            :let [line (in input y)
                  x (% (* (/ y down) right) (length line))]
            :when (= (chr "#") (in line x))]
           1)))

(defn part1
  [input]
  (trees-in-slope-shorter input 3 1))

(defn part2
  [input]
  (* ;(seq [slope :in [[1 1] [3 1] [5 1] [7 1] [1 2]]]
           (trees-in-slope-shorter input (in slope 0) (in slope 1)))))

(if (= (in (dyn :args) 0) "day3.janet")
  (let [input (file/read stdin :all)
        input (peg/match grammar input)]
    (print "part1: " (part1 input))
    (print "part2: " (part2 input))))
