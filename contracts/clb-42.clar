(define-constant my-constant "This is a constant value")

(define-constant my-second-constant
    (concat my-constant " that depends on another")
)

(print my-constant)
(print my-second-constant)
