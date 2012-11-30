;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava   "aria2")
(homepage "aria2.sourceforge.net/")
(repository      "git://github.com/tatsuhiro-t/aria2")

(define (install tynnyri)
  (cond
    ; freebsd
    ((is-freebsd)
     (system
       '(autoreconf "-fi")
       `("./configure" ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)
       '(gmake clean)))
    (else
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install))))) 

