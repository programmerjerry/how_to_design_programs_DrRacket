;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tax_land) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(check-expect (sales-tax 537) 0) 
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 1282) (* 0.05 1282))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))

(define LOW-PRICE-TAX-LEVEL 1000)
(define LUXURY-PRICE-TAX-LEVEL 10000)


(define (sales-tax p) 
  (cond 
    [(and (<= 0 p) (< p LOW-PRICE-TAX-LEVEL)) 0]
    [(and (<= 1000 p) (< p LUXURY-PRICE-TAX-LEVEL)) (* 0.05 p)] 
    [(>= p LUXURY-PRICE-TAX-LEVEL) (* 0.08 p)]))


