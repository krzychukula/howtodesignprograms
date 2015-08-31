;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.4 Defining Structure Types|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

(define-struct new-posn [x y])

(make-new-posn 1 2)
(new-posn-x (make-new-posn 1 2))
(new-posn? (make-new-posn 1 2))


; STRUCT entry
(define-struct entry [name phone email])

(define pl
  (make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu"))
 
(define bh
  (make-entry "Tara Harper" "666-7770" "harper@small-college.edu"))

(entry-name pl)
(entry-name bh)
(entry-email pl)
(entry-phone pl)