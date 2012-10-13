
(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use util.list)
(require-extension
  (srfi 1))
(use panna)
(use maali)
(use kirjasto.pääte)

(define (search pullo)
  (let ((display-packages (lambda (p)
                            (display (path-sans-extension p))
                            (display " "))))

    (display (paint  ":: " (colour-symbol1)))
    (display (paint  "found packages" (colour-message)))
    (newline)
    (map display-packages
         (filter
           (lambda (p) (string-scan p pullo))
           (directory-list (kaava-kansio) :children? #t)))
    (newline)))

(define (search-all)
  (let ((pretty-packages (lambda (p)
                            (display (path-sans-extension p))
                            ))
        (file-lst (map pretty-packages (directory-list (kaava-kansio) :children? #t))))
    (puts-columns file-lst)
    ))


(define (main args)
  (cond
    ((null-list? (cdr args))
     (search-all))
    (else
      (search (cadr args)))))
