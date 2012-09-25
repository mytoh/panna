(use panna.kaava)

(kaava      "mplayer")
(homepage   "www.mplayerhq.hu")
(repository   "svn://svn.mplayerhq.hu/mplayer/trunk")

(define (install tynnyri)
  (cond 
    ((is-freebsd)
     (system
       `(./configure   ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)
       '(gmake clean)
       '(gmake distclean)
       )
     )
    (else
     (system
       `(./configure   ,(string-append "--prefix=" tynnyri))
       '(make)
       '(make install)
       '(make clean)
       '(make distclean)
       )
     )
    )
  )
