
;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "python3")
(homepage "www.python.org")
(repository "http://hg.python.org/cpython")

(define (install tynnyri)
  (with-clang)
  (system
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)
    '(make distclean)
    ))

