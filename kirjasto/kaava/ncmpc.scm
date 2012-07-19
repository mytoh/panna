;;; -*- coding: utf-8 -*-

(use panna.kaava)

(define kaava "ncmpc")
(define homepage "http://mpd.wikia.com/wiki/Client:Ncmpc")
(define repository "git://git.musicpd.org/master/ncmpc.git")

(define (install tynnyri)
  (with-clang)
  (system
    `("./autogen.sh"
      ,(string-append "--prefix=" tynnyri)
      "--enable-lyrics-screen"
      "--enable-artist-screen")

    '(make)
    '(make install)
    '(make clean)))

