

(use panna.kaava)
(use file.util)

(kaava "ypsilon")
(homepage "//www.littlewingpinball.com")
(repository "http://ypsilon.googlecode.com/svn/trunk/")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (system
       `(gmake ,(string-append "PREFIX=" tynnyri))
       `(gmake ,(string-append "PREFIX=" tynnyri) install)
       '(gmake clean)
       '(gmake distclean)))
    (else
      (system
        `(make ,(string-append "PREFIX=" tynnyri))
        `(make ,(string-append "PREFIX=" tynnyri) install)
        '(make clean)
        '(make distclean))
      )))
