(define (ends-e sent)
  (cond ((equal? sent '()) '())
    ((equal? (last (first sent)) 'e) (se (first sent) (ends-e (bf sent))))
    (else (ends-e (bf sent)))))
