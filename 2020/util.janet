(defn read-numbers
  ``read line separated numbers as array``
  [f]
  (def res @[])
  (loop [line :iterate (file/read f :line)]
    (if-let [n (scan-number (string/trimr line))]
      (array/push res n)
      (error "not a number")))
  res)

(defn bsearch
  ``Find the first value in `ind` that satisfies `pred` using binary search.``
  [pred ind]
  (var l 0)
  (var r (- (length ind) 1))
  (var res nil)
  (while (if (<= l r) (nil? res))
    (let [m (math/floor (/ (+ l r) 2))
          n (in ind m)
          c (pred n)]
      (cond
            (< c 0) (set l (+ m 1))
            (> c 0) (set r (- m 1))
            (set res n))))
  res)
