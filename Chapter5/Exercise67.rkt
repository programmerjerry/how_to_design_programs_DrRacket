;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Exercise67) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

(make-balld 11 "down")

(define-struct vel [deltax deltay])

(define-struct ball [posn vel])

(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))

