(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (lambda (x) (f ((repeated f (- n 1)) x)))))
