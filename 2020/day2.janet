(def grammar
  ~{:line (/ (* (<- :d+) "-" (<- :d+) " " (<- :w) ": " (<- :w+) "\n")
             ,(fn fmt-line[min max char password] {:min (scan-number min)
                                                   :max (scan-number max)
                                                   :char char
                                                   :password password}))
    :main (some :line)})

(defn part1
  [inputs]
  (var valid 0)
  (each input inputs
    (let [n (length (string/find-all (input :char) (input :password)))]
      (when (and (>= n (input :min)) (<= n (input :max)))
        (++ valid))))
  valid)

(defn part2
  [inputs]
  (var valid 0)
  (each input inputs
    (let [a (in (input :password) (- (input :min) 1))
          b (in (input :password) (- (input :max) 1))
          c (in (input :char) 0)]
      (when (and (or (= a c) (= b c)) (not= a b))
        (++ valid))))
  valid)

(if (= (in (dyn :args) 0) "day2.janet")
  (let [input (file/read stdin :all)
        passwords (peg/match grammar input)]
    (print "part1: " (part1 passwords))
    (print "part2: " (part2 passwords))))
