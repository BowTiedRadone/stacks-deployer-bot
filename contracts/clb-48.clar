;; A map that creates a principal => uint relation.
(define-map balances principal uint)

;; Set the "balance" of the tx-sender to u500.
(map-set balances tx-sender u500)

;; Retrieve the balance.
(print (map-get? balances tx-sender))
