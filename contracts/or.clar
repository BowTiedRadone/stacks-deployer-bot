(or true false) ;; Returns true
(or (is-eq (+ 1 2) 1) (is-eq 4 4)) ;; Returns true
(or (is-eq (+ 1 2) 1) (is-eq 3 4)) ;; Returns false
(or (is-eq (+ 1 2) 3) (is-eq 4 4)) ;; Returns true