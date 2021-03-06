(use panna.kaava)

(kaava  "fish")
(homepage  "github.com/fish-shell/fish-shell")
(repository   "git://github.com/fish-shell/fish-shell")

(define (install prefix)
  (cond
    ((is-freebsd)
     (add-environment-variable
       "LIBS" "-liconv")
     (with-usr-local)
     (system
       '(autoconf)
       `(./configure ,(string-append "--prefix=" prefix))
       '(gmake user_doc)
       '(gmake)
       '(gmake install)
       '(gmake clean)
       ))
    (else
      (system
        '(autoconf)
        `(./configure ,(string-append "--prefix=" prefix) --without-xsel)
       '(make user_doc)
        '(make)
        '(make install))
      '(make distclean clean))))

