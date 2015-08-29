;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |SampleProblem 4.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Sample Problem: Design a program that launches a rocket when the user of your program presses the space bar. The program first displays the rocket sitting at the bottom of the canvas. Once launched, it moves upward at three pixels per clock tick.


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
  (big-bang #false
     [on-tick nxt]
     [on-key keh]
     [to-draw render]))


; Position KeyEvent -> WorldState
; on space changes world state from #false to 0
(check-expect (keh #false " ") 0)
(check-expect (keh 13 "right") 13)
(check-expect (keh 13 " ") 13)
(define (keh w k)
  (cond
    [(and (false? w) (string=? " " k)) 0]
    [else w]))


; WorldState -> WorldState
; computes next location of the ROCKET 
(check-expect (nxt 11) 14)
(check-expect (nxt #false) #false)
(define (nxt y)
  (cond
    [(false? y) y]
    [else (+ y 3)]))
 
; WorldState -> Image
; place rocket on the bottom edge
(define (render y)
   (place-image ROCKET (/ WIDTH 2)
                (cond
                  [(false? y) start-position]
                  [else (- start-position y)])
  MT))


(main 0)

