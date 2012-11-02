

(use panna.kaava)

(kaava   "vicare")
(homepage "")
(repository   "git://github.com/marcomaggi/vicare" )

(define (install tynnyri)
  (cond
    ; freebsd
    ((is-freebsd)
     (with-usr-local)
     (system '(sh ./autogen.sh))
     (make-directory* "=build")
     (current-directory "=build")
     (system
       `("../configure" ,(string-append "--prefix=" tynnyri))
       '(gmake)
       '(gmake install)))
    (else
      (with-clang)
      (system
        '(sh ./autogen.sh)
        '(mkdir =build)
        '(cd =build)
        `("../configure" ,(string-append "--prefix=" tynnyri))
        '(make)
        '(make install)))))

