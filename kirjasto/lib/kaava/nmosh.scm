

(use panna.kaava)

(kaava   "nmosh")
(homepage "mosh.monaos.org")
(repository   "git://github.com/okuoku/mosh" )

(cond
  ; freebsd
  ((is-freebsd)
   (define (install prefix)
     (with-clang)
     (with-usr-local)
     (system '("./gen-git-build.sh"))
     (system
       `("./configure" ,(string-append "--prefix=" prefix))
       '(gmake)
       '(gmake check)
       '(gmake install))))
  (else
    (define (install tynnyri)
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install)))))

