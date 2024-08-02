(define-map scores principal uint)

;; Insert a value.
(map-insert scores tx-sender u100)

;; This second insert will do nothing because the key already exists.
(map-insert scores tx-sender u200)

;; The score for tx-sender will be u100.
(print (map-get? scores tx-sender))

;; Delete the entry for tx-sender.
(map-delete scores tx-sender)

;; Will return none because the entry got deleted.
(print (map-get? scores tx-sender))
