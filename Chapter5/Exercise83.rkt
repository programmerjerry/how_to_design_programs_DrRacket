;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise83) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post]) 
; An Editor is a structure: 
;    (make-editor String String) 
; interpretation (make-editor s t) describes an editor 
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(define editor2 (make-editor "hello " "world"))

(define (render editor1)
  (overlay/align "left" "center"
                 (beside      (text (editor-pre editor1) 16 "black")
                              (rectangle 1 20 "solid" "red")
                              (text (editor-post editor1) 16 "black"))           
                 (empty-scene 200 20)))

