(define-map names-map { name: (string-ascii 12) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(default-to 0 (get id (map-get? names-map (tuple (name "blockstack"))))) ;; Returns 1337
(default-to 0 (get id (map-get? names-map (tuple (name "non-existant"))))) ;; Returns 0