;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise80) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title director year])

(define m1 (make-movie "aa" "bb" "2019"))

(define-struct pet [name number])

(define p1 (make-pet "cc" 123))

(define-struct CD [artist title price])

(define c1 (make-CD "aa" "bb" 11))

(define-struct sweater [material size color])

(define s1 (make-sweater "a" 3 "red"))
