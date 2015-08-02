;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fixed-size-data) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(add1 2);3 increments the given number
(ceiling 12.3); 13 closes integer above
(denominator 2/3); 3 denominator of a rational
(exact->inexact 12); #12.0 convert to inexact
(expt 16 1/2); 4 power of the first to the second
(expt 2 8);256
(floor 12.3); #i12.0
(gcd 6 12 8); 2  greatest common divisor
(log 1); 0 base-e logarithm
(max 0 5 -4); 5
(numerator 2/3); 2 numerator of a rational
(quotient 9 2);4 dividend/divisor = quotient 
(remainder 9 2);1 (modulo?)
(sqr 8); 64 8 * 8

(random 42); 0 < n <= 42

(/ 4 6)

(sqrt 2)




(define x 12)
(define y 5)

(sqrt (+ (sqr x) (sqr y)))


;1.2 The Arithmetic of Strings

(string-append "what a " "lovely " "day" "for learning BSL")

;(== (string-append "a" "b") "ab")

(define prefix "hello")
(define suffix "world")

(string-append prefix "_" suffix)

; 1.3 Mixing It up