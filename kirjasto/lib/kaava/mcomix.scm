;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "mcomix")
(homepage "mcomix.sourceforge.net")
(repository "https://mcomix.svn.sourceforge.net/svnroot/mcomix")

(define (install tynnyri)
  (system
    `(python setup.py install --prefix ,tynnyri)
    ))

