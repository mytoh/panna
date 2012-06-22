(use panna.kaava)

(define kaava  "ncmpcpp")
(define repository  "git://repo.or.cz/ncmpcpp.git" )


(define (install tynnyri)
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
