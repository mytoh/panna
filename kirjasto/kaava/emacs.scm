;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "emacs")
(define homepage "http://gnu.org/s/emacs")
(define repository "git://git.savannah.gnu.org/emacs.git")

(define (install tynnyri)
  (system
    '("./autogen.sh")
    `("./configure" "-with-x-toolkit=gtk3" "-with-wide-int" ,(string-append "--prefix=" tynnyri))
    '(gmake)
    '(gmake install)
    '(gmake clean)
    '(gmake distclean)
    ))

