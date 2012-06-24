;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "bazaar")
(define homepage "http://wiki.bazaar.canonical.com")
(define repository "bzr://lp:bzr")

(define (install tynnyri)
  (with-clang)
  (system
    `(python setup.py install --prefix ,tynnyri)
    ))

