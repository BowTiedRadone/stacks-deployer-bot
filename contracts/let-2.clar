(let 
  ( (a 2) (b (+ 5 6 7))) 
  (print a) 
  (print b) 
  (+ a b)) ;; Returns 20
(let 
  ( (a 5) (c (+ a 1)) (d (+ c 1)) (b (+ a c d))) 
  (print a) 
  (print b) 
  (+ a b)) ;; Returns 23