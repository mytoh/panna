
(use file.util)
(use kirjasto)
(use panna.kaava)

(kaava  "dzen")
(homepage "github.com/robm/dzen")
(repository     "git://github.com/robm/dzen")

(define (install tynnyri)
  (with-clang)
  (system
    `(env ,(string-append "PREFIX=" tynnyri)
                  gmake install)))
