(use panna.kaava)

(kaava  "ncmpcpp")
(homepage  "unkart.ovh.org/ncmpcpp")
(repository  "git://repo.or.cz/ncmpcpp.git" )


(define (install tynnyri)
  (with-clang)
  (with-panna-library)
  (system
    '(./autogen.sh)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  --enable-outputs
                  --enable-visualizer
                  --enable-clock
                  --enable-unicode)
    '(make)
    '(make install)
    '(make clean)
    ))
