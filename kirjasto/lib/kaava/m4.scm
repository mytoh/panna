

(use panna.kaava)

(kaava "m4")
(homepage "www.gnu.org/software/m4")
(repository  "git://git.sv.gnu.org/m4.git"  )


(define (install tynnyri)
  (with-clang)
  (system
    '(./bootstrap)
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(gmake)
    '(gmake install)
    '(gmake clean)))
