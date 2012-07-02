
(use file.util)
(use kirjasto)
(use panna.kaava)

(define kaava  "fasd")
(define homepage "http://github.com/clvv/fasd")
(define repository     "git://github.com/clvv/fasd")

(define (install tynnyri)
  (with-clang)
  (system
    `(env ,(string-append "PREFIX=" tynnyri)
                  make install)))
