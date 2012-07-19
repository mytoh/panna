
(use panna.kaava)

(kaava  "git")
(homepage  "git-scm.com")
(repository "git://github.com/git/git")

(define (install tynnyri)
  (with-clang)
  (system
    '(gmake clean)
    `(gmake ,(string-append "prefix=" tynnyri))
    `(gmake ,(string-append "prefix=" tynnyri) install)
    ))
