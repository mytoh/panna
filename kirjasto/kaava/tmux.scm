
(use panna.kaava)
(use file.util)

(kaava "tmux")
(homepage "tmux.sourceforge.net")
(repository "https://tmux.svn.sourceforge.net/svnroot/tmux")

(define (install tynnyri)
  (make-directory* "etc" )
  (system
    ; '(make clean)
    ; '(make distclean)
    '(aclocal)
    '(automake --add-missing --force-missing --copy --foreign)
    '(autoreconf)
    `(./configure ,(string-append "--prefix=" tynnyri)
                  ,(string-append "--exec-prefix=" tynnyri))
    '(make)
    '(make install)
    ))
