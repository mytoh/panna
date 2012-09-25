(define-module panna.ympäristö
(use gauche.parameter)
(use file.util)
(export
  kaava-kansio
  panna-kansio
  kellari-kansio
  riisi-kansio
  ))
(select-module panna.ympäristö)



(define kaava-kansio   (make-parameter (build-path (sys-getenv "OLUTPANIMO") "kirjasto" "kaava")))
(define panna-kansio   (make-parameter (resolve-path (sys-getenv "OLUTPANIMO"))))
(define kellari-kansio (make-parameter (build-path ( panna-kansio) "kellari")))
(define riisi-kansio   (make-parameter (build-path (panna-kansio) "riisi")))

