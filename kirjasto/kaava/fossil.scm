
(use panna.kaava)

(kaava "fossil")
(homepage "www.fossil-scm.org")
(repository "fossil://http://fossil-scm.org")

(define (install tynnyri)
  (with-clang)
  (system
    '(gmake)
    '(gmake install)
    ))
