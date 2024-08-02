(define-map names-map { name: (string-ascii 12) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(is-none (get id (map-get? names-map { name: "blockstack" }))) ;; Returns false
(is-none (get id (map-get? names-map { name: "non-existant" }))) ;; Returns true