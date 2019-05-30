(define (ordered? nums)
  (define (helper nums prev)
    (if (equal? nums '())
      #t
      (let ((cur (first nums)))
        (if (or (equal? prev '()) (>= cur prev))
          (helper (bf nums) cur)
          #f))))
  (helper nums '()))
