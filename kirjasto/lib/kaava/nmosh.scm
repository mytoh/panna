

(use panna.kaava)

(kaava   "nmosh")
(homepage "mosh.monaos.org")
(repository   "git://github.com/okuoku/mosh" )

(cond
  ; freebsd
  ((is-freebsd)
   (define (install prefix)
     (with-usr-local)
     (system '("./gen-git-build.sh"))
     (system
       `("./configure" ,(string-append "--prefix=" prefix))
       '(make)
       '(make check)
       '(make install))))
  (else
    (define (install tynnyri)
      (system
        '("./gen-git-build.sh")
        `("./configure" ,(string-append "--prefix=" prefix))
        '(make)
        '(make check)
        '(make install)))))

