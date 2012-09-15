
(use file.util)
(use kirjasto)
(use panna.kaava)

(kaava  "dzen")
(homepage "github.com/robm/dzen")
(repository     "git://github.com/robm/dzen")

(define (install tynnyri)
  (with-clang)
  (system '(gmake))
  (make-directory* (build-path tynnyri "bin"))
  (copy-file "dzen2" (build-path tynnyri "bin/dzen2"))
  (system `(chmod +x ,(build-path tynnyri "bin/dzen2")))
  )
