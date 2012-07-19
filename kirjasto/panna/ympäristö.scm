(define-module panna.ympäristö
(use gauche.parameter)
(use file.util)
(export
  kaava-kansio

  colour-package
  colour-message
  colour-command
  colour-symbol1
  colour-symbol2
  ))
(select-module panna.ympäristö)


(define-constant kaava-kansio
  (build-path (sys-getenv "OLUTPANIMO")
              "kirjasto"
              "kaava"))

(define colour-package (make-parameter 4))
(define colour-message (make-parameter 133))
(define colour-command (make-parameter 50))
(define colour-symbol1 (make-parameter 155))
(define colour-symbol2 (make-parameter 99))


(provide "panna/ympäristö")
