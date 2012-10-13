":"; exec gosh -- $0 "$@"

(use file.util)
(use gauche.parameter)
(use panna)
(use maali)
(use kirjasto.pääte)

(define (list-packages)
  (display (paint  ":: " (colour-symbol1)))
  (display (paint  "installed packages" (colour-message)))
  (newline)
  (puts-coloumns (directory-list (kellari-kansio) :children? #t)))

(define (list-package-contents kaava)
  (let* ((tynnyri (make-parameter (build-path (kellari-kansio) kaava))))
    (print (string-append (paint  ":: " (colour-symbol1))
                          (paint  "files installed as " (colour-message))
                          (paint  kaava (colour-package))))
    (for-each print
              (directory-fold (tynnyri) cons '()
                              :lister (lambda (path seed)
                                        (values (directory-list path :add-path? #t :children? #t)
                                                (cons path seed)))))))

(define (main args)
  (if (<= 2 (length args))
    (list-package-contents (cadr args))
    (list-packages)))
