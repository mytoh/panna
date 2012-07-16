;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "aseprite")
(define homepage "")
(define repository "git://github.com/dacap/aseprite")

(define (install tynnyri)
  (make-directory* "build")
  (current-directory "build")
  (system
    `(cmake .. -G "Unix Makefiles"
            ,(string-append "-DCMAKE_INSTALL_PREFIX=" tynnyri))
    '(gmake)
    '(nmake))
     (remove-directory* "build"))

