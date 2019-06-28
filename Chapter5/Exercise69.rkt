;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise69) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;entry
;name phone email
;"Al Abe" "666-7771" "lee@x.me"

(define-struct ball [location velocity])

(define-struct vel [deltax deltay])

(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))


(define-struct entry [name phone email])

(define pl (make-entry "Al Abe" "666-7771" "lee@x.me"))

(entry-name pl)

(ball-velocity ball1)



(vel-deltax (ball-velocity ball1))


(make-vel -10 5)

(make-entry "Tara Harp" "666-7770" "th@smlu.edu")

(define-struct centry [name home office cell])
 
(define-struct phone [area number])

(make-centry
 "Shriram Fisler"
 (make-phone 207 "363-2421")
 (make-phone 101 "776-1099")
 (make-phone 208 "112-9981"))

(vel-deltax (ball-velocity ball1))