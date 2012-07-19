;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "bazaar")
(homepage "wiki.bazaar.canonical.com")
(repository "bzr://lp:bzr")

(define (install tynnyri)
  (with-clang)
  (system
    `(python setup.py install --prefix ,tynnyri)
    ))

