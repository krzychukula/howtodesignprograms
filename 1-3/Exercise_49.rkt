;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_49) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)


(define scene-width 500)
(define scene-height 100)

(define scene (empty-scene scene-width scene-height))

;WorldState happiness
(define max-happiness 100)

;WorldState
; Draws happines relative to max-happiness
(define (render x)
 (cond
  [(= x 0) scene]
  [else (rectangle (* (/ x max-happiness) scene-width) scene-height "solid" "red")]))

; WorldState -> WorldState
; decrease happines to 0 by -0.1
(define (tock w)
  (cond
    [(< (- w 0.1) 0) 0]
    [else (- w 0.1)])
  )

; WorldState -> WorldState
; up and down buttons improve happiness
(define (change w a-key)
  (cond
    [(key=? a-key "up")    (+ w 1/3)]
    [(key=? a-key "down")  (+ w 1/5)]
    [else w]))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-key change]
            [to-draw render]))

(main 100)