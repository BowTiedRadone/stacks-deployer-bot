(buff-to-uint-be 0x01) ;; Returns u1
(buff-to-uint-be 0x00000000000000000000000000000001) ;; Returns u1
(buff-to-uint-be 0xffffffffffffffffffffffffffffffff) ;; Returns u340282366920938463463374607431768211455
(buff-to-uint-be 0x) ;; Returns u0