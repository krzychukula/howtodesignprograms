;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.6 Programming with Structures|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))


(define-struct entry [name phone email])
; An Entry is a structure: (make-entry String String String)
; interpretation a contact's name, 7-digit phone#, and email address

;Exercise 72. Formulate a data definition for the above phone structure type definition that accommodates the given examples.

; no idea what this is about...



;Next formulate a data definition for phone numbers using this structure type definition:
(define-struct phone# [area switch num])
; A Phone# is a structure: (make-phone# Number String Number)
; interpretation creates phone number with area switch and number



;Exercise 73. Design the function posn-up-x, which consumes a Posn p and a Number n. It produces a Posn like p with n in the x field.

;A neat observation is that we can define x+ using posn-up-x:
;(define (x+ p)
;  (posn-up-x p (+ (posn-x p) 3)))
;Note Functions such as posn-up-x are called updaters functional setters. They are extremely useful when you write large programs. image

; Posn Number -> Posn
; increase x-coordinate by n
(check-expect (posn-up-x (make-posn 0 0) 3) (make-posn 3 0))
(define (posn-up-x p n)
  (make-posn (+ (posn-x p) n) (posn-y p)))





(define-struct vel [deltax deltay])
; A Vel is a structure: (make-vel Number Number)
; interpretation (make-vel dx dy) means a velocity of dx pixels [per tick]
; along the horizontal and dy pixels along the vertical direction

(define-struct ufo [loc vel])
; A UFO is a structure: (make-ufo Posn Vel)
; interpretation (make-ufo p v) is at location p moving at velocity v 
; For Vel, see above. 

(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))
 
(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))
 
(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))


; UFO -> UFO
; determines where u moves in one clock tick; 
; leaves the velocity as is
 
(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2) (make-ufo (make-posn 17 77) v2))
 

(define (ufo-move-1 u)
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u)) (ufo-vel u)))


; Posn Vel -> Posn 
; adds v to p
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))

(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

;Exercise 75. Enter these definitions and their test cases into the definitions area of DrRacket and make sure they work. It is the first time that we made a “wish” and you need to make sure you understand how the two functions work together. image


