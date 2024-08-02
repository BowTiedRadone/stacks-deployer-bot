(element-at? "blockstack" u5) ;; Returns (some "s")
(element-at? (list 1 2 3 4 5) u5) ;; Returns none
(element-at? (list 1 2 3 4 5) (+ u1 u2)) ;; Returns (some 4)
(element-at? "abcd" u1) ;; Returns (some "b")
(element-at? 0xfb01 u1) ;; Returns (some 0x01)