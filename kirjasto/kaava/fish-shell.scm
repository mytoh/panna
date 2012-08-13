(use panna.kaava)

(kaava  "fish-shell")
(homepage  "github.com/fish-shell/fish-shell")
(repository   "git://github.com/fish-shell/fish-shell")

(define (install prefix)
  (cond
    ((is-freebsd)
     (with-clang)
     (add-environment-variable
       "LIBS" "-liconv")
     (with-usr-local)
     (system
       '(autoconf)
       `(./configure ,(string-append "--prefix=" prefix))
       '(gmake)
       '(gmake install)
       '(gmake clean)
       ))
    (else
      (system
        '(autoconf)
        `(./configure ,(string-append "--prefix=" prefix) --without-xsel)
        '(make)
        '(make install))
      '(make distclean clean))))

