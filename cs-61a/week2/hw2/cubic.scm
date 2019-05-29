(define (deriv g)
  (let ((dx 0.00001)) (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
    (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
