(use ../util)

(let [input [1 2 3 8 9 10]]
  (assert (= (bsearch |(- $ -1) input)  nil))
  (assert (= (bsearch |(- $ 1)  input)  1))
  (assert (= (bsearch |(- $ 2)  input)  2))
  (assert (= (bsearch |(- $ 3)  input)  3))
  (assert (= (bsearch |(- $ 10) input)  10))
  (assert (= (bsearch |(- $ 11) input)) nil))

(let [input [1 2 3 8 10]]
  (assert (= (bsearch |(- $ -1) input)  nil))
  (assert (= (bsearch |(- $ 1)  input)  1))
  (assert (= (bsearch |(- $ 2)  input)  2))
  (assert (= (bsearch |(- $ 3)  input)  3))
  (assert (= (bsearch |(- $ 10) input)  10))
  (assert (= (bsearch |(- $ 11) input)) nil))

(let [input [1 2]]
  (assert (= (bsearch |(- $ -1) input)  nil))
  (assert (= (bsearch |(- $ 1)  input)  1))
  (assert (= (bsearch |(- $ 2)  input)  2))
  (assert (= (bsearch |(- $ 3)  input)  nil))
  (assert (= (bsearch |(- $ 10) input)  nil))
  (assert (= (bsearch |(- $ 11) input)) nil))

(let [input [2]]
  (assert (= (bsearch |(- $ -1) input)  nil))
  (assert (= (bsearch |(- $ 1)  input)  nil))
  (assert (= (bsearch |(- $ 2)  input)  2))
  (assert (= (bsearch |(- $ 3)  input)  nil))
  (assert (= (bsearch |(- $ 10) input)  nil))
  (assert (= (bsearch |(- $ 11) input)) nil))
