(buff-to-int-le 0x01) ;; Returns 1
(buff-to-int-le 0x01000000000000000000000000000000) ;; Returns 1
(buff-to-int-le 0xffffffffffffffffffffffffffffffff) ;; Returns -1
(buff-to-int-le 0x) ;; Returns 0