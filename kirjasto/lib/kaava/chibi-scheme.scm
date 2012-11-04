;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "chibi-scheme")
(homepage "synthcode.com/wiki/chibi-scheme")
(repository '("https://code.google.com/p/chibi-scheme"  hg))

(define (install tynnyri)
  (with-clang)
  (with-usr-local)
  (system
    '(make)
    '(make test)
    `(env (string-append  "PREFIX=" tynnyri) make install)
    '(make clean)
    '(make distclean)
    ))

