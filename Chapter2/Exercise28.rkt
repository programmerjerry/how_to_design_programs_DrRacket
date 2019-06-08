;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise28) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define base-people-numbers 120)
(define base-ticket-price 5.0)
(define average-attendance-changes 15)
(define ten-cent-change-in-the-ticket-price 0.1)
(define fixed-cost 180)
(define variable-cost-of-per-attendee 0.04)

  
(define (attendees ticket-price) 
  (- base-people-numbers
     (* (- ticket-price
           base-ticket-price)
        (/ average-attendance-changes
           ten-cent-change-in-the-ticket-price))))

(define (revenue ticket-price) 
  (* ticket-price
     (attendees ticket-price)))

(define (cost ticket-price) 
  (+ fixed-cost
     (* variable-cost-of-per-attendee
        (attendees ticket-price))))

(define (profit ticket-price) 
  (- (revenue ticket-price) 
     (cost ticket-price)))

(define (profit1 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))
     