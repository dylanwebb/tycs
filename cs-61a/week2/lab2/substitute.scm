(define (substitute sent old new)
  (cond ((empty? sent) '())
    ((equal? (first sent) old) (se new (substitute (bf sent) old new)))
    (else (se (first sent) (substitute (bf sent) old new)))))