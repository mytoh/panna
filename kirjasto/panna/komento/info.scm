
(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)

(define (info pullo)
  (let* ((tynnyri (build-path (kellari-kansio) pullo)))
    (load (find-file-in-paths (string-append pullo ".scm")
                              :paths `(,( kaava-kansio))
                              :pred file-is-readable?))
    (display (colour-string (colour-info) "kaava: "))
    (print (colour-string (colour-info-package)  (kaava)))
    (display (colour-string (colour-info) "homepage: "))
    (print (colour-string (colour-info-homepage)  (homepage)))
    (display (colour-string (colour-info) "repository: "))
    (print (colour-string (colour-info-repository)  (repository)))
    ))


(define (main args)
  (info (cadr args)))
