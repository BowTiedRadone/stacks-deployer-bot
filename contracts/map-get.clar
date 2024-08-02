(define-map names-map { name: (string-ascii 10) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(map-get? names-map (tuple (name "blockstack"))) ;; Returns (some (tuple (id 1337)))
(map-get? names-map { name: "blockstack" }) ;; Same command, using a shorthand for constructing the tuple