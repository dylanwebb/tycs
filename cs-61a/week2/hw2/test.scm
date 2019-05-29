(load "product")

(define (factorial n)
  (product (lambda (x) x) 1 1+ n))

(define (approx-pi n)
  (* 4 (product term 1 (next a) n)))


(factorial 6)
