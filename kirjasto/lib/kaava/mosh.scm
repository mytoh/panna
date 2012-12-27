

(use panna.kaava)

(kaava   "mosh")
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
       '(gmake)
       '(gmake install)))
    (else
      (system
        '("./gen-git-build.sh")
        `("./configure" ,(string-append "--prefix=" prefix)
          ,(string-append "CPPFLAGS=-I/Users/" (sys-getenv "USER")
                          "/local/homebrew/include")
          ,(string-append "LDFLAGS=-L/Users/" (sys-getenv "USER")
                          "/local/homebrew/lib"))
        '(make)
        '(make install)))))

