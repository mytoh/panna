

(use panna.kaava)

(kaava   "vicare")
(homepage "")
(repository   "git://github.com/marcomaggi/vicare" )

(define (install tynnyri)
  (cond
    ; freebsd
    ((is-freebsd)
     (system
       '(sh ./BUILD-THE-INFRASTRUCTURE.sh)
       '(mkdir =build)
       '(cd =build)
       `("./configure" ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)))

    (else
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install))))) 

