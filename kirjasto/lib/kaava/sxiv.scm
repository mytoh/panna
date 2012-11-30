;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "sxiv")
(homepage "github.com/muennich/sxiv")
(repository "git://github.com/muennich/sxiv")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (system
       '(env "CFALGS=-I/usr/local/include/X11" "LDFLAGS=-L/usr/local/lib"
             ,(string-append "PREFIX=" tynnyri) gmake)
       '(gmake install)))
    (else
     (system
       '(env "CFALGS=-I/usr/local/include/X11" "LDFLAGS=-L/usr/local/lib"
             ,(string-append "PREFIX=" tynnyri) make)
       '(make install)))))

