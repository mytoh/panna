;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "libevent")
(homepage "http://libevent.org")
(repository "git://github.com/libevent/libevent")

(define (install tynnyri)
  (system
    '(./autogen.sh)
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    ; '(make verify)
    '(make install)
    '(make clean)
    '(make distclean)
    ))

