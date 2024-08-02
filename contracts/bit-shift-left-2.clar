(bit-shift-left 2 u1) ;; Returns 4
(bit-shift-left 16 u2) ;; Returns 64
(bit-shift-left -64 u1) ;; Returns -128
(bit-shift-left u4 u2) ;; Returns u16
(bit-shift-left 123 u9999999999) ;; Returns -170141183460469231731687303715884105728
(bit-shift-left u123 u9999999999) ;; Returns u170141183460469231731687303715884105728
(bit-shift-left -1 u7) ;; Returns -128
(bit-shift-left -1 u128) ;; Returns -1