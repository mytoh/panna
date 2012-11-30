;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "mercurial")
(homepage "mercurial.selenic.com")
(repository '("http://selenic.com/hg" hg))

(define (install tynnyri)
  (system
    `(python setup.py install ,(string-append "--install-base=" tynnyri)
             ,(string-append "--install-platbase=" (sys-getenv "OLUTPANIMO"))) 
    ))

