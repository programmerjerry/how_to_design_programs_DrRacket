;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Exercise66) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])

(make-movie "cat and mouse" "Dishni" "1990")

(define-struct person [name hair eyes phone])

(make-person "tom" "red" "red" "123321")

(define-struct pet [name number])

(make-pet "cat" 123123)

(define-struct CD [artist title price])

(make-CD "a" "bbb" 333)

(define-struct sweater [material size producer])

(make-sweater "colt" 33 "xx")

(define-struct entry [name phone email])

(make-entry "Al Abe" "666-7771" "lee@x.me")






(define-struct ball [location velocity])











