(use panna.kaava)

(define kaava  "fishfish")
(define repository   "git://gitorious.org/~ridiculousfish/fish-shell/fishfish.git")

(cond
  (( is-freebsd)  
   (define (install prefix)
     (with-clang)
     (add-environment-variable
       "LIBS" "-liconv") 
     (with-usr-local)
     (system
       '(autoconf)
       `(./configure ,(string-append "--prefix=" prefix) )
       '(gmake)
       '(gmake install)
       '(gmake clean)
       )))
  (else
    (define (install prefix)
      (system
        '(make distclean clean)
        `(./configure ,(string-append "--prefix=" prefix) --without-xsel)
        '(make)
        '(make install)))))

