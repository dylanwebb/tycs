(define (every proc sent)
  (if (empty? sent)
      '()
      (se (proc (first sent)) (every proc (bf sent)))))
