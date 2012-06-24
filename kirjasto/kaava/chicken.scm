;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "chicken")
(define homepage "http://code.call-cc.org")
(define repository "git://code.call-cc.org/chicken-core")

(cond
  ((is-freebsd)
   (define (install tynnyri)
     (with-clang)
     (system
       `(gmake PLATFORM=bsd spotless)
       `(gmake PLATFORM=bsd ,(string-append "PREFIX=" tynnyri)
              install)
       `(gmake PLATFORM=bsd confclean)
       )))
  (else
    (print "not supprted platform sorry")))

