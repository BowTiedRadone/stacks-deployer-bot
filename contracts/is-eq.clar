(is-eq 1 1) ;; Returns true
(is-eq true false) ;; Returns false
(is-eq "abc" 234 234) ;; Throws type error
(is-eq "abc" "abc") ;; Returns true
(is-eq 0x0102 0x0102) ;; Returns true