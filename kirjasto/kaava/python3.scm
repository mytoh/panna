
;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "python3")
(define homepage "http://www.python.org")
(define repository "http://hg.python.org/cpython")

(define (install tynnyri)
  (with-clang)
  (system
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)
    '(make distclean)
    ))

