;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |SampleProblem 4.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Sample Problem: Design a key-event handler that moves a red dot left or right on a horizontal line in response to pressing the left and right arrow keys.

(require 2htdp/universe)

(define radius 50)
(define scene (empty-scene (* radius 5) (* radius 2)))


; WorldState -> Image
; draw dot at given x
(define (draw x)
  (place-image light x radius scene))

; WorldState -> Image
(define light
  (circle radius "solid" "red"))

; Position KeyEvent -> WorldState
; moves the dot on x axis
(check-expect (keh 13 "left") 8)
(check-expect (keh 13 "right") 18)
(check-expect (keh 13 "a") 13)
(define (keh w k)
  (cond
    [(string=? "left" k)
     (- w 5)]
    [(string=? "right" k)
     (+ w 5)]
    [else w]))

(define (main x)
  (big-bang x
   [to-draw draw]
   [on-key keh]
   [stop-when zero?]))

(main 100)
