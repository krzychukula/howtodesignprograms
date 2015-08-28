;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |SampleProblem 4.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Sample Problem: Add a status line that says "descending" when the UFO’s height is above one third of the height of the canvas. It switches to "closing in" below that. And finally, when the UFO has reached the bottom of the canvas, the status notifies the player that the UFO has "landed."


(require 2htdp/universe)

; WorldState is a Number 
; interpretation height of UFO (from top)
 
; constants: 
(define WIDTH 300)
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
 
; visual constants: 
(define MT (empty-scene WIDTH HEIGHT))
(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 2 "solid" "green")))
 
; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]))
 
; WorldState -> WorldState
; computes next location of UFO 
 
(check-expect (nxt 11) 14)
 
(define (nxt y)
  (+ y 3))
 
; WorldState -> Image
; place UFO at given height into the center of MT
 
 
(define (render y)
   (overlay (status-line y) (place-image UFO (/ WIDTH 2) y MT)))

; WorldState -> Image
(define (status-line y)
  (text (get-text y) 24 "black"))

; WorldState -> String
(check-expect (get-text 0) "descending")
(check-expect (get-text (+ CLOSE 1)) "closing in")
(check-expect (get-text HEIGHT) "landed")
(define (get-text y)
  (cond
    [(< y CLOSE) "descending"]
    [(>= y HEIGHT) "landed"]
    [else "closing in"]))

(main 0)