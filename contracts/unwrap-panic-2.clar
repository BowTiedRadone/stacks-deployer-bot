(define-map names-map { name: (string-ascii 12) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(unwrap-panic (map-get? names-map { name: "blockstack" })) ;; Returns (tuple (id 1337))
(unwrap-panic (map-get? names-map { name: "non-existant" })) ;; Throws a runtime exception