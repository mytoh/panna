
(use panna.kaava)

(define kaava "fossil")
(define homepage "http://www.fossil-scm.org")
(define repository "fossil://http://fossil-scm.org")

(define (install tynnyri)
  (with-clang)
  (system
    '(gmake)
    '(gmake install)
    ))
