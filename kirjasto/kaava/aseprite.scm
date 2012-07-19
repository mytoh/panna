;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "aseprite")
(homepage "www.aseprite.org")
(repository "git://github.com/dacap/aseprite")

(define (install tynnyri)
  (make-directory* "build")
  (current-directory "build")
  (system
    `(cmake .. -G "Unix Makefiles"
            ,(string-append "-DCMAKE_INSTALL_PREFIX=" tynnyri))
    '(gmake)
    '(nmake))
     (remove-directory* "build"))

