

(use panna.kaava)
(use file.util)

(kaava "ypsilon")
(homepage "//www.littlewingpinball.com")
(repository "http://ypsilon.googlecode.com/svn/trunk/")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (with-clang)
     (system
       '(gmake)
       '(gmake install)
       '(gmake clean)
       '(gmake distclean)))
    (else
     (with-clang)
      (system
        '(make)
        '(make install)
        '(make clean)
        '(make distclean))
      )))
