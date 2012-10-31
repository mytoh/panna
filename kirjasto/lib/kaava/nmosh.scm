

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
       '(make)
       '(make check)
       '(make install))))
  (else
    (define (install tynnyri)
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system '("./gen-git-build.sh"))
      system
      `("./configure" ,(string-append "--prefix=" prefix))
      (system
        '(make)
        '(make check)
        '(make install)))))

