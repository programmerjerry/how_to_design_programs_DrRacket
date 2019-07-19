;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise103) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;spiders, whose relevant attributes are the number of remaining legs (we assume that spiders can lose legs in accidents)
;and the space they need in case of transport;
(define-struct spiders [number-of-remaining-legs space-of-transport])


;elephants, whose only attributes are the space they need in case of transport;
(define-struct elephants [space-of-transport])


;boa constrictors, whose attributes include length and girth; and
(define-struct boaconstrictors [length girth])


;armadillos, for which you must determine appropriate attributes, including one that determines the space needed for transport.
(define-struct armadillos [food space-of-transport])




(define-struct fits [fits cage])

