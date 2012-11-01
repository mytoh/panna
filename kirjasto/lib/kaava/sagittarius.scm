
;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "sagittarius")
(homepage "codes.google.com/p/sagittarius-scheme")
(repository '("https://code.google.com/p/sagittarius-scheme" hg))

(define (install tynnyri)
  (make-directory* "build")
  (current-directory "build")
  (system
    '(cmake ..)
    '(gmake)
    '(gmake test)
    '(gmake doc)
    '(gmake install)
    )
  )

