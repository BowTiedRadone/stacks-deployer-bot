(define-read-only (calc-bmi (weight int) (height int))
   ;;(ok (/ weight height)))
   ;; weight kg height cm
   (ok (* (/ weight height height) 10000))
)