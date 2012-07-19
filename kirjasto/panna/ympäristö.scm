(define-module panna.ympäristö
(use gauche.parameter)
(use file.util)
(export
  kaava-kansio
  panna-kansio
  kellari-kansio
  riisi-kansio

  colour-package
  colour-message
  colour-command
  colour-symbol1
  colour-symbol2

  colour-info
  colour-info-package
  colour-info-homepage
  colour-info-repository
  ))
(select-module panna.ympäristö)



(define kaava-kansio   (make-parameter (build-path (sys-getenv "OLUTPANIMO") "kirjasto" "kaava")))
(define panna-kansio   (make-parameter (resolve-path (sys-getenv "OLUTPANIMO"))))
(define kellari-kansio (make-parameter (build-path ( panna-kansio) "kellari")))
(define riisi-kansio   (make-parameter (build-path (panna-kansio) "riisi")))

(define colour-package (make-parameter 4))
(define colour-message (make-parameter 137))
(define colour-command (make-parameter 50))
(define colour-symbol1 (make-parameter 155))
(define colour-symbol2 (make-parameter 99))

(define colour-info             (make-parameter 42))
(define colour-info-package     colour-package)
(define colour-info-homepage    (make-parameter 62))
(define colour-info-repository  (make-parameter 186))


