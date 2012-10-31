
(use panna.kaava)

(kaava   "mosh")
(homepage "mosh.mit.edu/")
(repository   "git://github.com/higepon/mosh" )

(define (install prefix)
  (cond
    ; freebsd
    ((is-freebsd)
     (with-clang)
     (with-usr-local)
     (system
       '(./gen-git-build.sh)
       `(./configure ,(string-append "--prefix=" prefix))
       '(make)
       '(make check)
       '(make install)))

    (else
      (with-clang)
      (system
        '(./gen-git-build.sh)
        `(./configure ,(string-append "--prefix=" prefix))
        '(make clean)
        '(make)
        '(make install)))))

