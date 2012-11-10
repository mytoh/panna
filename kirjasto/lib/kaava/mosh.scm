

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
       '(make)
       '(make install)))
    (else
     (add-environment-variable "CPPFLAGS"
                               (string-append "-I/Users/" (sys-getenv "USER")
                                              "/local/homebrew/include"))
     (add-environment-variable "LDFLAGS"
                               (string-append "-I/Users/" (sys-getenv "USER")
                                              "/local/homebrew/lib"))
      (system
        '("./gen-git-build.sh")
        `("./configure" ,(string-append "--prefix=" prefix))
        '(make)
        '(make install)))))

