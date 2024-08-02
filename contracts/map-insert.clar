(define-map names-map { name: (string-ascii 10) } { id: int })
(map-insert names-map { name: "blockstack" } { id: 1337 }) ;; Returns true
(map-insert names-map { name: "blockstack" } { id: 1337 }) ;; Returns false
(map-insert names-map (tuple (name "blockstack")) (tuple (id 1337))) ;; Same command, using a shorthand for constructing the tuple