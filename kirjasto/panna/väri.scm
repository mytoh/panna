

(define-module panna.väri
(use gauche.parameter)
(use file.util)
(export

  colour-package
  colour-message
  colour-command
  colour-path
  colour-symbol1
  colour-symbol2

  colour-info
  colour-info-package
  colour-info-homepage
  colour-info-repository
  ))
(select-module panna.väri)



(define kaava-kansio   (make-parameter (build-path (sys-getenv "OLUTPANIMO") "kirjasto" "kaava")))
(define panna-kansio   (make-parameter (resolve-path (sys-getenv "OLUTPANIMO"))))
(define kellari-kansio (make-parameter (build-path ( panna-kansio) "kellari")))
(define riisi-kansio   (make-parameter (build-path (panna-kansio) "riisi")))

(define colour-package (make-parameter 4))
(define colour-message (make-parameter 177))
(define colour-command (make-parameter 50))
(define colour-path    (make-parameter 90))
(define colour-symbol1 (make-parameter 155))
(define colour-symbol2 (make-parameter 99))

(define colour-info             (make-parameter 42))
(define colour-info-package     colour-package)
(define colour-info-homepage    (make-parameter 62))
(define colour-info-repository  (make-parameter 186))


