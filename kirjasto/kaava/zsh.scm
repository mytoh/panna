

(use panna.kaava)

(kaava  "zsh")
(homepage  "zsh.sourceforge.net/")
(repository "git://zsh.git.sf.net/gitroot/zsh/zsh")

(define (install tynnyri)
  (cond 
    ((is-freebsd)
     (with-clang)
     (system
       '(./Util/preconfig)
       `(./configure ,(string-append "--prefix=" tynnyri))
       `(gmake)
       `(gmake install)
       `(gmake clean)
       )
     )
    (else
     (with-clang)
     (system
       '(./Util/preconfig)
       `(./configure ,(string-append "--prefix=" tynnyri))
       `(make)
       `(make install)
       `(make clean)
       ))))
