
(use file.util)
(use kirjasto)
(use panna.kaava)

(kaava  "dswm")
(homepage "dss-project.org")
(repository     "git://github.com/dss-project/dswm")

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
