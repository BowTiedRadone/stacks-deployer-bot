(define-map names-map { name: (string-ascii 12) } { id: int })
(map-insert names-map { name: "blockstack" } { id: 1337 }) ;; Returns true
(get id (tuple (name "blockstack") (id 1337))) ;; Returns 1337
(get id (map-get? names-map (tuple (name "blockstack")))) ;; Returns (some 1337)
(get id (map-get? names-map (tuple (name "non-existent")))) ;; Returns none