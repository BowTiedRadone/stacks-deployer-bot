(define-map names-map { name: (string-ascii 12) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(is-some (get id (map-get? names-map { name: "blockstack" }))) ;; Returns true
(is-some (get id (map-get? names-map { name: "non-existant" }))) ;; Returns false