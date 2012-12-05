
(use panna.kaava)

(kaava "mlterm")
(homepage "mlterm.sourceforge.net")
(repository '("http://mlterm.hg.sourceforge.net:8000/hgroot/mlterm/mlterm" hg))

(define (install prefix)
  (with-usr-local)
  (system
    `(./configure ,(string-append "--prefix=" prefix)
                  "--enable-ibus"
                  "--enable-fribidi"
                  "--with-type-engines=\"xcore,xft,cairo\""
                  "--with-imagelib=gdk-pixbuf2"
                  "--enable-utmp"
                  "--disable-iiimf"
                  )
    '(gmake)
    '(gmake install)
    '(gmake clean)))

