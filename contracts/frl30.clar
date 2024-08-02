;;
;; Fly functions
;;

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

;; this function will print a message
;;  (and emit an event) if the tx-sender was
;;  an authorized flyer.
;;
;;  here we use tx-sender, because we want
;;   to allow the user to let other contracts
;;   fly the ship on behalf of users

(define-public (fly-ship (ship uint))
  (let ((pilots (default-to
                   (list)
                  (map-get? allowed-pilots  ship))))
    (if (contains tx-sender pilots)
        (begin (print "Flew the rocket-ship!")
               (ok true))
        (begin (print "Tried to fly without permission!")
               (ok false)))))
;;
;; Authorize a new pilot.
;;
;;  here we want to ensure that this function
;;   was called _directly_ by the user by
;;   checking that tx-sender and contract-caller are equal.
;;  if any other contract is in the call stack, contract-caller
;;   would be updated to a different principal.
;;
(define-public (authorize-pilot (ship uint) (pilot principal))
 (begin
   ;; sender must equal caller: an intermediate contract is
   ;;  not issuing this call.
   (asserts! (is-eq tx-sender contract-caller) (err u1))
   ;; sender must own the rocket ship
   (asserts! (is-eq (some tx-sender)
                  (nft-get-owner? rocket ship)) (err u2))
   (let ((prev-pilots (default-to
                         (list)
                         (map-get? allowed-pilots ship))))
    ;; don't add a pilot already in the list
    (asserts! (not (contains pilot prev-pilots)) (err u3))
    ;; append to the list, and check that it is less than
    ;;  the allowed maximum
    (match (as-max-len? (append prev-pilots pilot) u10)
           next-pilots
             (ok (map-set allowed-pilots ship next-pilots))
           ;; too many pilots already
           (err u4)))))

;;
;; Set Factory
;;
;; This function can only be called once.
;; args:
;; returns: Response<Principal, int>
(define-public (set-factory)
  (let ((factory-entry
         (map-get? factory-address  0)))
    (if (and (is-none factory-entry)
             (map-insert factory-address
                            0 tx-sender))
        (ok tx-sender)
        factory-already-set-err)))