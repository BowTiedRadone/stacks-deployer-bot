(define-read-only (get-meta (token-id uint))
  (if (is-eq token-id u1)
    (ok (some {name: "EVERYDAYS: THE FIRST 5000 DAYS", uri: "https://ipfsgateway.makersplace.com/ipfs/QmZ15eQX8FPjfrtdX3QYbrhZxJpbLpvDpsgb2p3VEH8Bqq", mime-type: "image/jpeg"}))
    (ok none)))

(define-read-only (get-nft-meta)
  (ok (some {name: "beeple", uri: "https://ipfsgateway.makersplace.com/ipfs/QmZ15eQX8FPjfrtdX3QYbrhZxJpbLpvDpsgb2p3VEH8Bqq", mime-type: "image/jpeg"})))

(define-read-only (get-errstr (code uint))
  (ok (if (is-eq u401 code)
    "nft-not-owned"
    (if (is-eq u404 code)
      "nft-not-found"
      (if (is-eq u405 code)
        "sender-equals-recipient"
        "unknown-error")))))