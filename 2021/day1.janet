(import ./util)

(defn part1
  ``Count how many times the number in xs increases``
  [xs]
  (var n 0)
  (loop [i :range [1 (length xs)]]
    (when (< (xs (- i 1)) (xs i))
      (++ n)))
  n)

(assert (= 7 (part1 [199
                     200
                     208
                     210
                     200
                     207
                     240
                     269
                     260
                     263
                     ])))

(defn part2
  ``Count how many times the numbers in a 3 element sliding window increases``
  [xs]
  (var n 0)
  (loop [i :range [1 (+ (- (length xs) 3) 1)]]
    (when (< (sum (slice xs (- i 1) (+ i 2)))
             (sum (slice xs i (+ i 3))))
      (++ n)))
  n)

(assert (= 5 (part2 [199
                     200
                     208
                     210
                     200
                     207
                     240
                     269
                     260
                     263
                     ])))

(if (= (last (string/split "/" (in (dyn :args) 0))) "day1.janet")
  (let [input (util/read-numbers stdin)]
    (print "part1: " (part1 input))
    (print "part2: " (part2 input))))
