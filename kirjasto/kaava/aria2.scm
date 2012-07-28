;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava   "aria2")
(homepage "aria2.sourceforge.net/")
(repository      "git://github.com/tatsuhiro-t/aria2")

(cond
  ; freebsd
  ((is-freebsd)
   (define (install tynnyri)
     ; (with-clang)
     (system
       '(autoreconf "-fi")
       `("./configure" ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)
       '(gmake clean))))

  (else
    (define (install tynnyri)
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install)))))
