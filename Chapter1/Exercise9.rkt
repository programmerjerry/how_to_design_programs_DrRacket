;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define in 3)

(if (number? in)
    3)

(if (string=? in)
    (string-length in))

(if (image=? in)
    (* (image-width in)
       (image-height in)))

(if (and (number? in)
         (> in 0))
    (- in 1))

(if (= in 10)
    #true)

(if (= in 20)
    #false)


    