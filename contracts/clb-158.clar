(define-map listings
    uint
    {
        maker: principal,
        taker: (optional principal),
        token-id: uint,
        nft-asset-contract: principal,
        expiry: uint,
        price: uint,
        payment-asset-contract: (optional principal)
    }
)