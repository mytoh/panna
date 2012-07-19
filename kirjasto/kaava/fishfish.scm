(use panna.kaava)

(kaava  "fishfish")
(homepage  "github.com/fish-shell/fish-shell")
(repository   "git://github.com/fish-shell/fish-shell")

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

