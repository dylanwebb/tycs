(define (switch sent)
  (define (replace wd 1st)
    (cond ((equal? wd 'i) 'you)
      ((equal? wd 'me) 'you)
      ((and (equal? wd 'you) 1st) 'I)
      ((equal? wd 'you) 'me)
      (else wd)))
  (define (helper sent 1st)
    (cond ((equal? sent '()) '())
      (else (se (replace (first sent) 1st) (helper (bf sent) #f)))))
  (helper sent #t))
