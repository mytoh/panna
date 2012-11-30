
(use panna.kaava)

(kaava   "liferea")
(homepage     "liferea.sourceforge.net")
(repository   "git://liferea.git.sourceforge.net/gitroot/liferea/liferea")

(define (install tynnyri)
  (system
  '(gmake clean)
  '(gmake distclean)
  '(./autogen.sh)
  `(./configure   ,(string-append "--prefix=" tynnyri))
  '(gmake)
  '(gmake install)
  ))
