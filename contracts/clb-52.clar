;; A map that creates a string-ascii => uint relation.
(define-map names (string-ascii 34) principal)

;; Point the name "Clarity" to the tx-sender.
(map-set names "Clarity" tx-sender)

;; Retrieve the principal related to the name "Clarity".
(print (map-get? names "Clarity"))

;; Retrieve the principal for a key that does not exist. It will return `none`.
(print (map-get? names "bogus"))

;; Unwrap a value:
(print (unwrap-panic (map-get? names "Clarity")))
