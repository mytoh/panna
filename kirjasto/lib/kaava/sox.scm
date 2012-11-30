(use panna.kaava)


(kaava   "sox")
(homepage   "sox.sourceforge.net")
(repository   "git://sox.git.sourceforge.net/gitroot/sox/sox")


(define (install tynnyri)
    (sys-putenv "CPPFLAGS=-I/usr/local/include")
    (sys-putenv "LDFLAGS=-L/usr/local/lib")
  (system
    '(autoreconf -vfi)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  )
    '(make -s)
    '(make install)
    '(make clean)
    '(make distclean)
    ))
