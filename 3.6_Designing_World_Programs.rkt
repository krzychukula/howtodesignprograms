;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3.6_Designing_World_Programs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)


(define WIDTH-OF-WORLD 200)
 
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS "outline" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR-LENGTH (* WHEEL-RADIUS 10))
(define DOWN (rectangle CAR-LENGTH WHEEL-RADIUS "solid" "red"))
(define UPPER-CAR-LENGTH (* WHEEL-RADIUS 7))
(define UP (rectangle UPPER-CAR-LENGTH WHEEL-RADIUS "solid" "red"))
(define CAR-BASE (above UP DOWN))
(define CAR (overlay/offset BOTH-WHEELS 0 (- WHEEL-RADIUS) CAR-BASE ))

(define BACKGROUND (empty-scene 100 100))
; WorldState is a Number
; interpretation the number of pixels between the left border and the car


; WorldState -> Image
; places the image of the car x pixels from the left margin of
; The BACKGROUND image
(define (render x)
  BACKGROUND)

; WorldState -> WorldState
; adds 3 to x to move the car right
(define (tock x)
  x)

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))




