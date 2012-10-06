
(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)
(use maali)

(define (info pullo)
  (let* ((tynnyri (build-path (kellari-kansio) pullo)))
    (load-build-file pullo (kaava-kansio))
    (display (paint  "kaava: " (colour-info)))
    (print (paint    (colour-info-package) (kaava)))
    (display (paint  "homepage: " (colour-info)))
    (print (paint   (homepage) (colour-info-homepage)))
    (display (paint  "repository: " (colour-info)))
    (print (paint   (repository) (colour-info-repository)))
    ))


(define (main args)
  (info (cadr args)))
