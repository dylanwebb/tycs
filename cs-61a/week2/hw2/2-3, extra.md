Our Scheme library provides versions of the `every` function from the last exercise and the `keep` function shown in lecture. Get familiar with these by trying examples such as the following:  

`(every (lambda (letter) (word letter letter)) 'purple)` - returns `(pp uu rr pp ll ee)`  
`(every (lambda (number) (if (even? number) (word number number) number)) '(781 5 76 909 24))` - returns `(781 5 7676 909 2424)`  
`(keep even? '(781 5 76 909 24))` - returns `(76 24)`  
`(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper)` - returns `ooeee`  
`(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy)` - returns `""`  
`(keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy))` - returns `Error`  
`(keep (lambda (wd) (member? 'e wd)) '(purple syzygy))` - returns `(purple)`  


In principle, we could build a version of Scheme with no primitives except `lambda`. Everything else can be defined in terms of `lambda`, although it’s not done that way in practice because it would be so painful. But we can get a sense of the flavor of such a language by eliminating one feature at a time from Scheme to see how to work around it.  
In this problem we explore a Scheme without `define`. We can give things names by using argument binding, as `let` does, so instead of
```Lisp
(define (sumsq a b)
  (define (square x) (* x x)) (+ (square a) (square b)))

(sumsq 3 4)
```
we can say
```Lisp
((lambda (a b)
  ((lambda (square)
    (+ (square a) (square b)))
  (lambda (x) (* x x))))
3 4)
```
This works fine as long as we don’t want to use recursive procedures. But we can’t replace
```Lisp
(define (fact n)
  (if (= n 0)
    1
    (* n (fact (- n 1)))))

(fact 5)
```
by
```Lisp
((lambda (n)
   (if ...))
5)
```
because what do we do about the invocation of `fact` inside the body?
Your task is to find a way to express the `fact` procedure in a Scheme without any way to define global names.

```Lisp
((lambda (fact n)
  (fact fact n))
(lambda (self n)
  (if (= n 0)
      1
      (* n (self self (- n 1)))))
5)
```
