;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "mercurial")
(define homepage "http://mercurial.selenic.com")
(define repository '("http://selenic.com/hg" hg))

(define (install tynnyri)
  (with-clang)
  (system
    `(python setup.py install ,(string-append "--install-base=" tynnyri)
             ,(string-append "--install-platbase=" (sys-getenv "OLUTPANIMO"))) 
    ))

