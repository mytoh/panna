;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "ranger")
(homepage "http://ranger.nongnu.org")
(repository "git://git.savannah.nongnu.org/ranger.git")

(define (install tynnyri)
  (with-clang)
  (system
    `(python setup.py install ,(string-append "--prefix=" tynnyri))
    ))

