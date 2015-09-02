;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 74|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Exercise 74. Copy all relevant constant and function definitions to DrRacket’s definition area. Add the tests and make sure they pass. Then run the program and use the mouse to place the red dot. image

(require 2htdp/universe)

; visual constants 
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))
 
; The state of the world is represented by a Posn.
 
; Posn -> Posn 
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

(define (reset-dot p x y me)
  (cond
    [(mouse=? me "button-down") (make-posn x y)]
    [else p]))


; Posn -> Posn
; increases the x-coordinate of p by 3
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))
(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))


(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))


(main (make-posn 10 10))