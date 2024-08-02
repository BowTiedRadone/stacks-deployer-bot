(define-non-fungible-token stackaroo (string-ascii 40))
(nft-mint? stackaroo "Roo" 'SPAXYA5XS51713FDTQ8H94EJ4V579CXMTRNBZKSF) ;; Returns (ok true)
(nft-burn? stackaroo "Roo" 'SPAXYA5XS51713FDTQ8H94EJ4V579CXMTRNBZKSF) ;; Returns (ok true)