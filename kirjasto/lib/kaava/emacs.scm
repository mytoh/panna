;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "emacs")
(homepage "gnu.org/s/emacs")
(repository "git://git.savannah.gnu.org/emacs.git")

(define (install tynnyri)
  (system
    '("./autogen.sh")
    `("./configure" "-with-x-toolkit=gtk3" "--without-selinux" "--with-x" "--without-xaw3d" "--without-compress-info" "-with-wide-int" ,(string-append "--prefix=" tynnyri))
    '(gmake)
    '(gmake install)
    '(gmake clean)
    '(gmake distclean)
    ))

