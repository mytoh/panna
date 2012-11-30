;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "subversion")
(homepage "subversion.apache.org")
(repository "http://svn.apache.org/repos/asf/subversion/trunk")

(define (install tynnyri)
  (add-environment-variable "CPPFLAGS" "-I/usr/local/include/apache22")
  (system
    '(sh "./autogen.sh")
    `(./configure ,(string-append "--prefix=" tynnyri)
                  "--without-apxs"
                  "--without-apache-libexecdir"
                  "--enable-experimental-libtool"
                  "--disable-shared")
    '(make)
    '(make install)))

