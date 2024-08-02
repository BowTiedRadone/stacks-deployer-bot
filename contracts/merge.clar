(define-map users { id: int } { name: (string-ascii 12), address: (optional principal) })
(map-insert users { id: 1337 } { name: "john", address: none }) ;; Returns true
(let 
  ( (user (unwrap-panic (map-get? users { id: 1337 }))))    
  (merge user { address: (some 'SPAXYA5XS51713FDTQ8H94EJ4V579CXMTRNBZKSF) })) ;; Returns (tuple (address (some SPAXYA5XS51713FDTQ8H94EJ4V579CXMTRNBZKSF)) (name "john"))