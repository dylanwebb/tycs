(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product (lambda (x) x) 1 1+ n))

(define (approx-pi n)
  (let ((pi-term (lambda (x)
    (if (= (remainder x 2) 0)
      (/ (+ x 2) (+ x 1))
      (/ (+ x 1) (+ x 2))))))
  (* 4 (product pi-term 1 1+ n))))

(approx-pi 1000)
