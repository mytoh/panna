
(use panna.kaava)

(kaava  "git")
(homepage  "git-scm.com")
(repository "git://github.com/git/git")

(define (install tynnyri)
  (cond 
    ((is-freebsd)
     (system
       `(gmake ,(string-append "prefix=" tynnyri))
       `(gmake ,(string-append "prefix=" tynnyri) install)
       '(gmake clean)
       ))
    (else
      (system
        `(make ,(string-append "prefix=" tynnyri))
        `(make ,(string-append "prefix=" tynnyri) install)
        '(make clean)
        ))))
