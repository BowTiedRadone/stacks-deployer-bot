(define-map orders uint {maker: principal, amount: uint})

;; Set two orders.
(map-set orders u0 {maker: tx-sender, amount: u50})
(map-set orders u1 {maker: tx-sender, amount: u120})

;; retrieve order with ID u1.
(print (map-get? orders u1))
