
;; error handling
(define-constant nft-not-owned-err (err u401)) ;; unauthorized
(define-constant nft-not-found-err (err u404)) ;; not found
(define-constant sender-equals-recipient-err (err u405)) ;; method not allowed
(define-constant nft-exists-err (err u409)) ;; conflict

(define-private (nft-transfer-err (code uint))
  (if (is-eq u1 code)
    nft-not-owned-err
    (if (is-eq u2 code)
      sender-equals-recipient-err
      (if (is-eq u3 code)
        nft-not-found-err
        (err code)))))

(define-private (nft-mint-err (code uint))
  (if (is-eq u1 code)
    nft-exists-err
    (err code)))

(define-read-only (get-errstr (code uint))
  (ok
    (if (is-eq u401 code)
      "nft-not-owned"
      (if (is-eq u404 code)
        "nft-not-found"
        (if (is-eq u405 code)
          "sender-equals-recipient"
          (if (is-eq u409 code)
            "nft-exists"
            "unknown-error"))))))