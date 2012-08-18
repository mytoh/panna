;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "tor")
(homepage "www.torproject.org/")
(repository "git://git.torproject.org/tor.git")

(define (install tynnyri)
  (add-environment-variable
    "CPPFLAGS" "-I/usr/local/include/event2")
  (add-environment-variable
    "LDFLAGS" "-L/usr/local/lib/event2")
  (with-usr-local)
  (with-clang)
  (system
    '(./autogen.sh)
    `("./configure" ,(string-append "--prefix=" tynnyri)
                  "--with-openssl-dir=\"/usr/\""
                  "--disable-asciidoc"
                  )
    '(make)
    '(make install)
    '(make clean)
    '(make distclean)
    ))

