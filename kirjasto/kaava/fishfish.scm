(use panna.kaava)

(define kaava  "fishfish")

(cond
  (( is-freebsd)  
   (define (install tynnyri)
     ; (with-clang)
     (with-usr-local)
     (system
       '(autoconf)
       `(./configure ,(string-append "--prefix=" tynnyri) )
       '(gmake)
       '(gmake install)
       '(gmake clean)
       )))
  (else
    (define (install tynnyri)
      (system
        '(make distclean clean)
        `(./configure ,(string-append "--prefix=" tynnyri) --without-xsel)
        '(make)
        '(make install)))))

