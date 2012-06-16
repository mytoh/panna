;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "tor")
(define homepage "https://www.torproject.org/")
(define repository "git://git.torproject.org/tor.git")

(define (install tynnyri)
  (add-environment-variable
    "CPPFLAGS" "-I/usr/local/include/event2")
  (add-environment-variable
    "LDFLAGS" "-L/usr/local/lib/event2")
  (with-usr-local)
  (with-clang)
  (system
    '(make clean)
    '(make distclean)
    `("./configure" ,(string-append "--prefix=" tynnyri)
                  "--with-openssl-dir=\"/usr/\""
                  "--disable-asciidoc"
                  )
    '(make)
    '(make install)
    ))

