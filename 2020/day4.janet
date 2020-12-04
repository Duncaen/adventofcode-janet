(def grammar
  (peg/compile
    ~{:key (/ (<- (+ "byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid" "cid")) ,keyword)
      :value (<- (to (set " \n")))
      :field (* :key ":" :value (set " \n"))
      :passport (/ (* (group (some :field)) (opt "\n")) ,(fn[xs] (table ;xs)))
      :main (* (any :passport) -1)
      }))

(defn- valid-part1?
  [passport]
  (match passport @{:byr _ :iyr _ :eyr _ :hgt _ :hcl _ :ecl _ :pid _} true))

(defn part1
  [input]
  (count valid-part1? input))

(def- color-grammar (peg/compile '(* "#" (repeat 6 (range "09" "af")) -1)))
(defn- valid-color? [c] (truthy? (peg/match color-grammar c)))

(defn- valid-eye-color?
  [ecl]
  (get {"amb" true
        "blu" true
        "brn" true
        "gry" true
        "grn" true
        "hzl" true
        "oth" true} ecl false))

(defn- valid-part2?
  [passport]
  (match
    passport
    @{:byr byr :iyr iyr :eyr eyr :hgt hgt :hcl hcl :ecl ecl :pid pid}
    (and 
      (<= 1920 (scan-number byr) 2002)
      (<= 2010 (scan-number iyr) 2020)
      (<= 2020 (scan-number eyr) 2030)
      (cond
        (string/has-suffix? "cm" hgt) (<= 150 (scan-number (string/slice hgt 0 -3)) 193)
        (string/has-suffix? "in" hgt) (<= 59 (scan-number (string/slice hgt 0 -3)) 76))
      (valid-color? hcl)
      (valid-eye-color? ecl)
      (= (length pid) 9))))

(defn part2
  [input]
  (count valid-part2? input))

(if (= (in (dyn :args) 0) "day4.janet")
  (let [input (file/read stdin :all)
        input (peg/match grammar input)]
    (print "part1: " (part1 input))
    (print "part2: " (part2 input))))
