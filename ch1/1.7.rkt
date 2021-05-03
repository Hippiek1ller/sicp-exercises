#lang racket

(define (square x)(* x x))
(define (abs x)(if (> x 0) x (- x)))
(define (good-enough? guess x)(<(abs (- (square guess) x)) 0.001))
(define (average x y) (/(+ x y) 2))
(define (improve-guess guess x)(average guess (/ x guess)))
(define (square-iter guess x)
  (if (good-enough? guess x )
      guess
      (square-iter(improve-guess guess x)
                   x)))
(define (sqrt x) (square-iter 1.0 x))

;; Because of limited precision we can't rely on the difference between the square of the guess
;; and the number for which we calculate the square root
;; result will be greater than 0.001 for valid square root.
(good-enough? 7745966.692414834 60000000000000)

;; When we caluclate the root for number that is close to our tolerance
;; good-enough? procedure can give inappropriate result.
;; In this case our number and guess are 0.002 and 0.050131352980478244 respectively. 
(good-enough? 0.050131352980478244 0.002)

;; Let's define new good-enough? procedure
(define (new-good-enough? guess next-guess x)(= guess next-guess))
(define (new-square-iter guess x)
  (if (new-good-enough? guess (improve-guess guess x)x)
      guess
      (new-square-iter(improve-guess guess x)
                   x)))
(define (new-sqrt x) (new-square-iter 1.0 x))
(new-sqrt 0.002)

