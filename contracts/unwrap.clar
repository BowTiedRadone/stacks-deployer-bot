(define-map names-map { name: (string-ascii 12) } { id: int })
(map-set names-map { name: "blockstack" } { id: 1337 })
(define-private (get-name-or-err (name (string-ascii 12)))  
  (let ( (raw-name (unwrap! (map-get? names-map { name: name }) (err 1))))       
  (ok raw-name)))
(get-name-or-err "blockstack") ;; Returns (ok (tuple (id 1337)))
(get-name-or-err "non-existant") ;; Returns (err 1)