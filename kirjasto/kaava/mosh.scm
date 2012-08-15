
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
       `(./configure ,(string-append "--prefix=" prefix) )
       '(gmake)
       '(gmake check)
       '(gmake install)))

  (else
    (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install))))) 

