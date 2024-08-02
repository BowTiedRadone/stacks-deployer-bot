(define-map highest-bids
    {listing-id: uint, asset: (optional principal)}
    {bid-id: uint}
)

(map-set highest-bids {listing-id: u5, asset: none} {bid-id: u20})
