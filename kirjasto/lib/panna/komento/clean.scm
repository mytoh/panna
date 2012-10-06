
(use file.util)
(use panna)
(use gauche.parameter)
(use srfi-1)
(use maali)

(define (clean pullo)
  (let* ((kaava  (make-parameter pullo))
         (riisi (make-parameter (build-path (riisi-kansio) (kaava)))))

    (display (paint  ">>> " (colour-symbol2)))
    (print (paint  "clean source directory" (colour-message)))

    (when (file-is-directory? (riisi))
      (remove-directory* (riisi)))))

(define (main args)
  (clean (cadr args)))
