
(use panna.kaava)

(kaava  "git")
(homepage  "git-scm.com")
(repository "git://github.com/git/git")

(define (install tynnyri)
  (cond 
    ((is-freebsd)
     (with-clang)
     (system
       '(gmake clean)
       `(gmake ,(string-append "prefix=" tynnyri))
       `(gmake ,(string-append "prefix=" tynnyri) install)
       ))
    (else
     (system
       '(make clean)
       `(make ,(string-append "prefix=" tynnyri))
       `(make ,(string-append "prefix=" tynnyri) install)
       ))
    )
  )
