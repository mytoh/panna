;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "ncmpc")
(homepage "mpd.wikia.com/wiki/Client:Ncmpc")
(repository "git://git.musicpd.org/master/ncmpc.git")

(define (install tynnyri)
  (system
    `("./autogen.sh"
      ,(string-append "--prefix=" tynnyri)
      "--enable-lyrics-screen"
      "--enable-artist-screen")

    '(make)
    '(make install)
    '(make clean)))

