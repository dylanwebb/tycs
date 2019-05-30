(define (filter pred combiner null-value term a next b)
  (define (helper cur)
    (filter pred combiner null-value term (next cur) next b))
  (cond ((> a b) null-value)
        ((pred a) (combiner (term a) (helper a)))
        (else (combiner null-value (helper a)))))

(define (sum-prime-squares a b)
  (filter prime? + 0 (lambda (x) (* x x)) a 1+ b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relatively-prime-prod n)
  (filter (lambda (x) (= (gcd x n) 1)) * 1 (lambda (x) x) 1 1+ (- n 1)))

