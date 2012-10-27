(use panna.kaava)
(use kirjasto)

(kaava "mpd")
(homepage "mpd.wikia.com")
(repository "git://git.musicpd.org/master/mpd.git")


(define (install tynnyri)
  (with-usr-local)
  (with-clang)
  (system
    '(./autogen.sh)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  "--disable-soundcloud")
    '(make)
    '(make install)
    '(make clean)
    '(make distclean)
    ))
