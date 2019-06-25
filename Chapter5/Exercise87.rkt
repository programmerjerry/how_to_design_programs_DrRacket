;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise87) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [str index]) 
; An Editor is a structure: 
;    (make-editor String String) 
; interpretation (make-editor s t) describes an editor 
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(define editor2 (make-editor "hello world" 3))

(define MAX-EDITOR-LENGTH 24)

(define (string-rest str)
  (if (string=? str "")
      ""
      (substring str
                 1
                 (string-length str))))


(define (string-first str)
  (if (string=? str "")
      ""
      (substring str 0 1)))

(define (string-last str)
  (if (string=? str "")
      ""
      (substring str (- (string-length str)
                        1)
                 (string-length str))))

(define (string-remove-last str)
  (if (string=? str "")
      ""
      (substring str
                 0
                 (- (string-length str)
                    1))))


(define (render editor1)
  (overlay/align "left" "center"
                 (beside      (text (substring (editor-str editor1)
                                               0
                                               (editor-index editor1))
                                    16
                                    "black")
                              (rectangle 1 20 "solid" "red")
                              (text (substring (editor-str editor1)
                                               (editor-index editor1))
                                    16
                                    "black"))           
                 (empty-scene 200 20)))

(define (edit ed ke)
  (if (> (string-length ke) 1)
      (cond
        [(key=? "left" ke)
         (make-editor (editor-str ed)
                      (if (< (- (editor-index ed) 1) 0)
                          0
                          (- (editor-index ed) 1)))]
        [(key=? "right" ke)
         (make-editor (editor-str ed)
                      (if (> (+ (editor-index ed) 1)
                             (string-length (editor-str ed)))
                          (editor-index ed)
                          (+ (editor-index ed) 1)))]
        [else ed])
      (cond
        [(key=? "\b" ke)
         (make-editor (string-remove-last (editor-str ed))
                      (- (editor-index ed) 1))]
        [(or (key=? "\t" ke)
             (key=? "\r" ke)) ed]
        [else
         (if (> (string-length (editor-str ed))
                MAX-EDITOR-LENGTH)
             ed
             (make-editor (string-append (editor-str ed) ke)
                          (+ (editor-index ed) 1)))])))

(define (main ed)
  (big-bang ed
    [to-draw render]
    [on-key edit]))