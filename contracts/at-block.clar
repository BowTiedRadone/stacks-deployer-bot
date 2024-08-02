(define-data-var data int 1)
(at-block 0x0000000000000000000000000000000000000000000000000000000000000000 block-height) ;; Returns u0
(at-block (get-block-info? id-header-hash 0) (var-get data)) ;; Throws NoSuchDataVariable because `data` wasn't initialized at block height 0