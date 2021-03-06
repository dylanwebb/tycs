(define (sum-squares-two-largest a b c)
  (define (sum-squares x y)
    (define (sqre x)
      (* x x))
    (+ (sqre x) (sqre y)))
  (cond ((and (> a c) (> b c)) (sum-squares a b))
    ((and (> a b) (> c b)) (sum-squares a c))
    (else (sum-squares b c))))
