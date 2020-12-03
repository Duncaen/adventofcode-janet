(def grammar
  (peg/compile
    ~(some (group (* (/ (<- :d+) ,scan-number) "-"
                     (/ (<- :d+) ,scan-number) " "
                     (<- :w) ": "
                     (<- :w+) "\n")))))

(defn part1
  [inputs]
  (length (seq [[min max char pass] :in inputs
                :when (<= min (length (string/find-all char pass)) max)])))

(defn part2
  [inputs]
  (length (seq [[min max char pass] :in inputs
               :let [a (in pass (- min 1))
                     b (in pass (- max 1))
                     c (in char 0)]
               :when (and (or (= a c) (= b c)) (not= a b))])))

(if (= (in (dyn :args) 0) "day2.janet")
  (let [input (file/read stdin :all)
        passwords (peg/match grammar input)]
    (print "part1: " (part1 passwords))
    (print "part2: " (part2 passwords))))
