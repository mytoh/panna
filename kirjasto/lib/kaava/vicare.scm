

(use panna.kaava)

(kaava   "vicare")
(homepage "")
(repository   "git://github.com/marcomaggi/vicare" )

(define (install tynnyri)
  (cond
    ; freebsd
    ((is-freebsd)
     (system
       '(./autogen.sh)
       '(mkdir =build)
       '(cd =build)
       `("./configure" ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)))
    (else
      (with-clang)
      (system
        '(./autogen.sh)
        '(mkdir =build)
        '(cd =build)
        `("./configure" ,(string-append "--prefix=" tynnyri))
        '(make)
        '(make install)))))

