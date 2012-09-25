#!/usr/bin/env gosh

(use file.util)
(use gauche.parameter)
(use panna)

(define (list-packages)
  (display (colour-string (colour-symbol1) ":: "))
  (display (colour-string (colour-message) "installed packages"))
  (newline)
  (map print
       (directory-list (kellari-kansio) :children? #t)))

(define (list-package-contents kaava)
  (let* ((tynnyri (make-parameter (build-path (kellari-kansio) kaava))))
    (print (string-append (colour-string (colour-symbol1) ":: ")
                          (colour-string (colour-message) "files installed as ")
                          (colour-string (colour-package) kaava)))
    (for-each print
              (directory-fold (tynnyri) cons '()
                              :lister (lambda (path seed)
                                        (values (directory-list path :add-path? #t :children? #t)
                                                (cons path seed)))))))

(define (main args)
  (if (<= 2 (length args))
    (list-package-contents (cadr args))
    (list-packages )))
