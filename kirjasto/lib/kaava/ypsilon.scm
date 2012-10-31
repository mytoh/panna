

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
       `(gmake ,(string-append "PREFIX=" tynnyri))
       `(gmake install ,(string-append "PREFIX=" tynnyri))
       '(gmake clean)
       '(gmake distclean)))
    (else
      (with-clang)
      (system
        `(make ,(string-append "PREFIX=" tynnyri))
        `(make install ,(string-append "PREFIX=" tynnyri))
        '(make clean)
        '(make distclean))
      )))
