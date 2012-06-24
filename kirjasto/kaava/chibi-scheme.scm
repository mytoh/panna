;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "chibi-scheme")
(define homepage "http://synthcode.com/wiki/chibi-scheme")
(define repository "https://chibi-scheme.googlecode.com/hg")

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

