
(use file.util)
(use kirjasto)
(use panna.kaava)

(kaava  "fasd")
(homepage "github.com/clvv/fasd")
(repository     "git://github.com/clvv/fasd")

(define (install tynnyri)
  (with-clang)
  (system
    `(env ,(string-append "PREFIX=" tynnyri)
                  make install)))
