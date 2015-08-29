;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise55) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A LR (short for: launching rocket) is one of:
; – "resting"
; – non-negative number 
; interpretation "resting" represents a rocket on the ground
; a number denotes the height of a rocket in flight 


(require 2htdp/universe)


; constants: 
(define WIDTH 300)
(define HEIGHT 100)
 
; visual constants: 
(define MT (empty-scene WIDTH HEIGHT))
(define ROCKET
  (triangle 40 "solid" "tan"))

; bottom edge of the screen
(define start-position (- HEIGHT (* (image-height ROCKET) 0.5))) 
 
; WorldState -> WorldState
(define (main y)
  (big-bang "resting"
     [on-tick nxt]
     [on-key keh]
     [to-draw render]))


; Position KeyEvent -> WorldState
; on space changes world state from #false to 0
(check-expect (keh "resting" " ") 0)
(check-expect (keh 13 "right") 13)
(check-expect (keh 13 " ") 13)
(define (keh w k)
  (cond
    [(and (not (number? w)) (string=? "resting" w) (string=? " " k)) 0]
    [else w]))


; WorldState -> WorldState
; computes next location of the ROCKET 
(check-expect (nxt 11) 14)
(check-expect (nxt "resting") "resting")
(define (nxt y)
  (cond
    [(number? y) (+ y 3)]
    [else y]))
 
; WorldState -> Image
; place rocket on the bottom edge
(define (render y)
   (place-image ROCKET (/ WIDTH 2)
                (cond
                  [(number? y) (- start-position y)]
                  [else start-position])
  MT))


(main 0)

