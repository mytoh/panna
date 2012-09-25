
(use panna.kaava)
(use file.util)

(kaava "tmux")
(homepage "tmux.sourceforge.net")
(repository "https://tmux.svn.sourceforge.net/svnroot/tmux/trunk")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (make-directory* "etc")
     (system
       '(aclocal)
       '(automake --add-missing --force-missing --copy --foreign)
       '(autoreconf)
       `(./configure ,(string-append "--prefix=" tynnyri)
                     ,(string-append "--exec-prefix=" tynnyri))
       '(make)
       '(make install)
       '(make clean)
       '(make distclean)))
    (else
      (system
        '(sh ./autogen.sh)
        `(./configure ,(string-append "--prefix=" tynnyri)
                      ,(string-append "--exec-prefix=" tynnyri))
        '(make)
        '(make install)
        '(make clean)
        '(make distclean))
      )))
