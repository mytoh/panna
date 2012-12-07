
(use panna.kaava)

(kaava "mlterm")
(homepage "mlterm.sourceforge.net")
(repository '("http://mlterm.hg.sourceforge.net:8000/hgroot/mlterm/mlterm" hg))

(define (install prefix)
  (with-usr-local)
  (with-clang)
  (system
    `(./configure ,(string-append "--prefix=" prefix)
                  "--with-gtk=3.0"

                  "--enable-ibus"
                  "--enable-fribidi"
                  "--enable-sixel"
                  "--enable-ssh2"
                  "--enable-pty-helper"
                  "--enable-uim"
                  "--enable-m17nlib"
                  "--enable-ibus"
                  "--enable-scim"
                  "--enable-vt52"
                  ; "--enable-utmp" ;; it will fail

                  "--disable-iiimf"
                  "--disable-kbd"
                  )
    '(make)
    '(make install)
    '(make clean)))

