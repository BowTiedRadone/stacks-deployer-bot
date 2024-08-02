;; Define an unsigned integer data var with an initial value of u0.
(define-data-var my-number uint u0)

;; Print the initial value.
(print (var-get my-number))

;; Change the value.
(var-set my-number u5000)

;; Print the new value.
(print (var-get my-number))
