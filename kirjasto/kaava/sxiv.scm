;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "sxiv")
(define homepage "git://github.com/muennich/sxiv")
(define repository "git://github.com/muennich/sxiv")

(define (install tynnyri)
  (with-clang)
  (system
    '(env "CFALGS=-I/usr/local/include/X11" "LDFLAGS=-L/usr/local/lib"
         ,(string-append "PREFIX=" tynnyri) gmake)
    '(gmake install)
    ))

