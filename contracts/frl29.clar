;; a map from rocket ships to their allowed
;;  pilots
(define-map allowed-pilots
    uint (list 10 principal))

;; implementing a contains function via fold
(define-private (contains-check
                  (y principal)
                  (to-check { p: principal, result: bool }))
   (if (get result to-check)
        to-check
        { p: (get p to-check),
          result: (is-eq (get p to-check) y) }))

(define-private (contains (x principal) (find-in (list 10 principal)))
   (get result (fold contains-check find-in
    { p: x, result: false })))

(define-read-only (is-my-ship (ship uint))
  (is-eq (some tx-sender) (nft-get-owner? rocket ship)))