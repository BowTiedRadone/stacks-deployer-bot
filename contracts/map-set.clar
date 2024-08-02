(define-map names-map { name: (string-ascii 10) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 }) ;; Returns true
(map-set names-map (tuple (name "blockstack")) (tuple (id 1337))) ;; Same command, using a shorthand for constructing the tuple