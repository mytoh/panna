
(use panna.kaava)

(kaava "fossil")
(homepage "www.fossil-scm.org")
(repository "fossil://http://fossil-scm.org")

(define (install tynnyri)
  (system
    '(gmake)
    '(gmake install)
    ))
