
(use panna.kaava)

(kaava "mlterm")
(homepage "mlterm.sourceforge.net")
(repository '("http://mlterm.hg.sourceforge.net:8000/hgroot/mlterm/mlterm" hg))

(define (install prefix)
  (with-usr-local)
  (system
    `(./configure ,(string-append "--prefix=" prefix))
    '(gmake user_doc)
    '(gmake)
    '(gmake install)
    '(gmake clean)))

