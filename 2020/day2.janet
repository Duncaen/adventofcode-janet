(def grammar
  (peg/compile
    ~(some (group (* (/ (<- :d+) ,scan-number) "-"
                     (/ (<- :d+) ,scan-number) " "
                     (<- :w) ": "
                     (<- :w+) "\n")))))
(defn- part1-valid?
  [[min max char pass]]
  (<= min (length (string/find-all char pass)) max))

(defn part1
  [inputs]
  (count part1-valid? inputs))

(defn- part2-valid?
  [[min max char pass]]
  (not= (= (in pass (- min 1)) (in char 0))
        (= (in pass (- max 1)) (in char 0))))

(defn part2
  [inputs]
  (count part2-valid? inputs))

(if (= (in (dyn :args) 0) "day2.janet")
  (let [input (file/read stdin :all)
        passwords (peg/match grammar input)]
    (print "part1: " (part1 passwords))
    (print "part2: " (part2 passwords))))
