;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise82) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct word [lettera letterb letterc])

(define word1 (make-word "a" "b" "c"))
(define word2 (make-word "a" "b" "z"))
(define word3 (make-word "a" "b" "z"))

(check-expect (compare-word word1 word2) #false)
(check-expect (compare-word word2 word3) #true)

(define (compare-word word1 word2)
  (if (not (string=? (word-lettera word1)
                     (word-lettera word2)))
      #false
      (if (not (string=? (word-letterb word1)
                         (word-letterb word2)))
          #false
          (if (not (string=? (word-letterc word1)
                             (word-letterc word2)))
              #false
              #true))))
          
  
