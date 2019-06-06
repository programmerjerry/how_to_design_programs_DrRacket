;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define LEFT 24)
(define HEIGHT 50)
(define WIDTH 40)
(define triangle1 (triangle WIDTH "solid" "green"))
(define triangle2 (triangle WIDTH "solid" "red"))
(define rectangle1 (rectangle (- WIDTH 20) HEIGHT "solid" "blue"))
(define rectangle2 (rectangle 400 440 "solid" "gray"))



(place-image triangle1
             LEFT HEIGHT
             (place-image triangle2
                          LEFT  (+ HEIGHT 20)
                          (place-image rectangle1
                                       LEFT  (+ HEIGHT 40)
                                       rectangle2)))