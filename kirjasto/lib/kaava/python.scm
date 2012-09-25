
;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "python")
(homepage "www.python.org")
(repository '("http://hg.python.org/releasing/2.7.3" hg 
                     ("-b" "2.7")))

(define (install tynnyri)
  (with-clang)
  (system
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)
    '(make distclean)
    ))

