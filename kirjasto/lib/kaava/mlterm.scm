
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
                  ; "--enable-utmp" ;; it will fail
                  "--disable-iiimf"
                  "--disable-kbd"
                  )
    '(make)
    '(make install)
    '(make clean)))

