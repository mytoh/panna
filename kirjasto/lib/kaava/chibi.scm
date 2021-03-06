;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "chibi")
(homepage "synthcode.com/wiki/chibi-scheme")
(repository '("https://code.google.com/p/chibi-scheme"  hg))

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (with-usr-local)  
     (system
       '(gmake)
       '(gmake test)
       `(gmake install ,(string-append  "PREFIX=" tynnyri))
       '(gmake clean)
       '(gmake distclean)))
    (else
      (system
        '(make)
        '(make test)
        `(make install ,(string-append  "PREFIX=" tynnyri))
        '(make clean)
        '(make distclean)))))

