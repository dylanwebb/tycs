This lab exercise concerns the change counting program below.

```Lisp
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```

------

Identify two ways to change the program to _reverse_ the order in which coins are tried, that is, to change the program so that pennies are tried first, then nickels, then dimes, and so on.

```Lisp
(define (count-change amount)
  (cc amount 1))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 6)) 0)
        (else (+ (cc amount
                     (+ kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```

```Lisp
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 5) 1)
        ((= kinds-of-coins 4) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 2) 25)
        ((= kinds-of-coins 1) 50)))
```
------

Abelson and Sussman claim that this change would not affect the _correctness_ of the computation. However, it does affect the _efficiency_ of the computation. Implement one of the ways you devised in exercise 1 for reversing the order in which coins are tried, and determine the extent to which the number of calls to cc is affected by the revision. Verify your answer on the computer, and provide an explanation. Hint: limit yourself to nickels and pennies, and compare the trees resulting from `(cc 5 2)` for each order.

```Lisp
(define (count-change amount)
  (cc amount 2))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)))

(cc 5 2)
.. -> cc with amount = 5,  kinds-of-coins = 2
.... -> cc with amount = 5,  kinds-of-coins = 1
...... -> cc with amount = 5,  kinds-of-coins = 0
...... <- cc returns 0
...... -> cc with amount = 4,  kinds-of-coins = 1
........ -> cc with amount = 4,  kinds-of-coins = 0
........ <- cc returns 0
........ -> cc with amount = 3,  kinds-of-coins = 1
.......... -> cc with amount = 3,  kinds-of-coins = 0
.......... <- cc returns 0
.......... -> cc with amount = 2,  kinds-of-coins = 1
............ -> cc with amount = 2,  kinds-of-coins = 0
............ <- cc returns 0
............ -> cc with amount = 1,  kinds-of-coins = 1
.............. -> cc with amount = 1,  kinds-of-coins = 0
.............. <- cc returns 0
.............. -> cc with amount = 0,  kinds-of-coins = 1
.............. <- cc returns 1
............ <- cc returns 1
.......... <- cc returns 1
........ <- cc returns 1
...... <- cc returns 1
.... <- cc returns 1
.... -> cc with amount = 0,  kinds-of-coins = 2
.... <- cc returns 1
.. <- cc returns 2
2
```

```Lisp
(define (count-change amount)
  (cc amount 2))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 2) 1)
        ((= kinds-of-coins 1) 5)))

(cc 5 2)
.. -> cc with amount = 5,  kinds-of-coins = 2
.... -> cc with amount = 5,  kinds-of-coins = 1
...... -> cc with amount = 5,  kinds-of-coins = 0
...... <- cc returns 0
...... -> cc with amount = 0,  kinds-of-coins = 1
...... <- cc returns 1
.... <- cc returns 1
.... -> cc with amount = 4,  kinds-of-coins = 2
...... -> cc with amount = 4,  kinds-of-coins = 1
........ -> cc with amount = 4,  kinds-of-coins = 0
........ <- cc returns 0
........ -> cc with amount = -1,  kinds-of-coins = 1
........ <- cc returns 0
...... <- cc returns 0
...... -> cc with amount = 3,  kinds-of-coins = 2
........ -> cc with amount = 3,  kinds-of-coins = 1
.......... -> cc with amount = 3,  kinds-of-coins = 0
.......... <- cc returns 0
.......... -> cc with amount = -2,  kinds-of-coins = 1
.......... <- cc returns 0
........ <- cc returns 0
........ -> cc with amount = 2,  kinds-of-coins = 2
.......... -> cc with amount = 2,  kinds-of-coins = 1
............ -> cc with amount = 2,  kinds-of-coins = 0
............ <- cc returns 0
............ -> cc with amount = -3,  kinds-of-coins = 1
............ <- cc returns 0
.......... <- cc returns 0
.......... -> cc with amount = 1,  kinds-of-coins = 2
............ -> cc with amount = 1,  kinds-of-coins = 1
.............. -> cc with amount = 1,  kinds-of-coins = 0
.............. <- cc returns 0
.............. -> cc with amount = -4,  kinds-of-coins = 1
.............. <- cc returns 0
............ <- cc returns 0
............ -> cc with amount = 0,  kinds-of-coins = 2
............ <- cc returns 1
.......... <- cc returns 1
........ <- cc returns 1
...... <- cc returns 1
.... <- cc returns 1
.. <- cc returns 2
2
```

When decrementing by larger amounts first, you are eliminating the need to call test negative amounts. Since `5` is greater than `1`, if there is room to take `5` out, there is room to take `1` out so recursive calls that do this are not wasted. The same is not true for the reverse.

------

Modify the `cc` procedure so that its `kinds-of-coins` parameter, instead of being an integer, is a _sentence_ that contains the values of the coins to be used in making change. The coins should be tried in the sequence they appear in the sentence. For the `count-change` procedure to work the same in the revised program as in the original, it should call `cc` as follows:

```Lisp
(define (count-change amount)
  (cc amount '(50 25 10 5 1)))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (empty? kinds-of-coins)) 0)
        (else (+ (cc amount
                     (bf kinds-of-coins))
                 (cc (- amount
                        (first kinds-of-coins))
                     kinds-of-coins)))))
```

------

Many Scheme procedures require a certain type of argument. For example, the arithmetic procedures only work if given numeric arguments. If given a non-number, an error results.  
Suppose we want to write _safe_ versions of procedures, that can check if the argument is okay, and either call the underlying procedure or return `#f` for a bad argument instead of giving an error. (We’ll restrict our attention to procedures that take a single argument.)
`(sqrt 'hello)` - returns ERROR: magnitude: Wrong type in arg1 hello`
`(type-check sqrt number? 'hello)` - returns `#f`
`(type-check sqrt number? 4)` - returns `2`

Write `type-check`. Its arguments are a function, a type-checking predicate that returns `#t` if and only if the datum is a legal argument to the function, and the datum.

```Lisp
(define (type-check proc type? arg)
  (if (type? arg)
      (proc arg)
      #f))
```

------

We really don’t want to have to use `type-check` explicitly every time. Instead, we’d like to be able to use a `safe-sqrt` procedure:  
`(safe-sqrt 'hello)` - returns `#f`  
`(safe-sqrt 4)` - returns `2`  
Don’t write `safe-sqrt`! Instead, write a procedure `make-safe` that you can use this way:
`(define safe-sqrt (make-safe sqrt number?))`
It should take two arguments, a function and a type-checking predicate, and return a new function that returns `#f` if its argument doesn’t satisfy the predicate.

```Lisp
(define (make-safe proc type?)
  (lambda (arg)
    (if (type? arg)
        (proc arg)
        #f)))
```
