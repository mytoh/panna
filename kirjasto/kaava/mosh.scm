
(use panna.kaava)

(define kaava   "mosh")
(define homepage "http://mosh.mit.edu/")
(define repository   "git://github.com/keithw/mosh" )

(cond
  ; freebsd
  ((is-freebsd)
   (define (install prefix)
     (with-clang)
     (system
      '(./autogen.sh)
       `(./configure ,(string-append "--prefix=" prefix) )
       '(make)
       '(make install)
       )))

  (else
    (define (install tynnyri)
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install)))
    ))

