

(use panna.kaava)
(use file.util)

(kaava "ypsilon")
(homepage "//www.littlewingpinball.com")
(repository "http://ypsilon.googlecode.com/svn/trunk/")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (system
       `(make ,(string-append "PREFIX=" tynnyri))
       `(make ,(string-append "PREFIX=" tynnyri) install)
       '(make clean)
       '(make distclean)))
    (else
      (system
        `(make ,(string-append "PREFIX=" tynnyri))
        `(make ,(string-append "PREFIX=" tynnyri) install)
        '(make clean)
        '(make distclean))
      )))
