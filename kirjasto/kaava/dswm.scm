
(use file.util)
(use kirjasto)
(use panna.kaava)

(define kaava  "dswm")
(define homepage "http://dss-project.org")
(define repository     "git://github.com/dss-project/dswm")

(define (install tynnyri)
  (with-clang)
  (system
    '(make clean)
    '(make distclean)
    '(autoconf)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  )
    '(make)
    '(make install)
    ))
