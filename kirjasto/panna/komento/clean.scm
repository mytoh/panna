
(use file.util)
(use panna)
(use gauche.parameter)
(use srfi-1)

(define (clean pullo)
  (let* ((kaava  (make-parameter pullo))
         (riisi (make-parameter (build-path (riisi-kansio) (kaava)))))

    (display (colour-string (colour-symbol2) ">>> "))
    (print (colour-string (colour-message) "clean source directory"))

    (when (file-is-directory? (riisi))
      (remove-directory* (riisi)))))

(define (main args)
  (clean (cadr args)))
