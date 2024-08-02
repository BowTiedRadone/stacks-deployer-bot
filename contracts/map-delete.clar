(define-map names-map { name: (string-ascii 10) } { id: int })
(map-insert names-map { name: "blockstack" } { id: 1337 }) ;; Returns true
(map-delete names-map { name: "blockstack" }) ;; Returns true
(map-delete names-map { name: "blockstack" }) ;; Returns false
(map-delete names-map (tuple (name "blockstack"))) ;; Same command, using a shorthand for constructing the tuple