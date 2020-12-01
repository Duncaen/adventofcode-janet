(defn read-numbers
  ``read line separated numbers from `path` as array``
  [path]
  (with [f (file/open path)]
    (def res @[])
    (loop [line :iterate (file/read f :line)]
      (array/push res (scan-number (string/trimr line))))
    res))
