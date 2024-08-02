;; Some error constants
(define-constant err-unknown-listing (err u100))
(define-constant err-not-the-maker (err u101))

;; Define an example map called listings, identified by a uint.
(define-map listings
    {id: uint}
    {name: (string-ascii 50), maker: principal}
)

;; Insert some sample data
(map-set listings {id: u1} {name: "First Listing", maker: tx-sender})
(map-set listings {id: u2} {name: "Second Listing", maker: tx-sender})

;; Simple function to get a listing
(define-read-only (get-listing (id uint))
    (map-get? listings {id: id})
)

;; Update name function that only the maker for a specific listing
;; can call.
(define-public (update-name (id uint) (new-name (string-ascii 50)))
    (let
        (
            ;; The magic happens here.
            (listing (unwrap! (get-listing id) err-unknown-listing))
        )
        (asserts! (is-eq tx-sender (get maker listing)) err-not-the-maker)
        (map-set listings {id: id} (merge listing {name: new-name}))
        (ok true)
    )
)

;; Two test calls
(print (update-name u1 "New name!"))
(print (update-name u9999 "Nonexistent listing..."))
