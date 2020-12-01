(defn read-numbers
  ``read line separated numbers as array``
  [f]
  (def res @[])
  (loop [line :iterate (file/read f :line)]
    (if-let [n (scan-number (string/trimr line))]
      (array/push res n)
      (error "not a number")))
  res)
