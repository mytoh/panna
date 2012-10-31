

(use panna.kaava)

(kaava   "nmosh")
(homepage "mosh.monaos.org")
(repository   "git://github.com/okuoku/mosh" )


(define (install prefix)
  (cond
    ; freebsd
    ((is-freebsd)
     (with-usr-local)
     (system '("./gen-git-build.sh"))
     (system
       `("./configure" ,(string-append "--prefix=" prefix))
       '(make)
       ; '(make check)
       '(make install)))
    (else
      (system
        '("./gen-git-build.sh")
        `("./configure" ,(string-append "--prefix=" prefix))
        '(make)
        '(make check)
        '(make install)))))

