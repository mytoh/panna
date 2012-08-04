(use kirjasto)
(use panna.kaava)

(kaava          "gauche")
(homepage    "practical-scheme.net" )
(repository    "git://gauche.git.sourceforge.net/gitroot/gauche/Gauche" )

(define (install tynnyri)
  ; (with-clang)
  (system
    '(./DIST gen)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  --with-iconv=/usr/local
                  )
    '(make)
    '(make install)))


