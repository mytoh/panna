;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "chibi")
(homepage "synthcode.com/wiki/chibi-scheme")
(repository '("https://code.google.com/p/chibi-scheme"  hg))

(define (install tynnyri)
  (with-clang)
  (with-usr-local)
  (system
    '(gmake)
    '(gmake test)
    `( gmake install ,(string-append  "PREFIX=" tynnyri))
    '(gmake clean)
    '(gmake distclean)
    ))

