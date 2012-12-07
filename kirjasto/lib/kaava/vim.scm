(use panna.kaava)

(kaava  "vim")
(homepage  "www.vim.org")
(repository "https://vim.googlecode.com/hg/")

(define (install tynnyri)
  (cond
    ((is-freebsd)
     (system
       `(./configure   ,(string-append
                          "--prefix=" tynnyri)
                       "--cache-file=/dev/null"
                       "--with-features=huge"
                       "--enable-multibyte"
                       "--enable-perlinterp"
                       "--enable-pythoninterp"
                       "--enable-luainterp"
                       "--enable-cscope"
                       "--enable-sniff"
                       "--enable-"
                       ; "--enable-mzschemeinterp"
                       "--enable-xim"
                       "--enable-fontset"

                       "--disable-darwin"
                       "--disable-selinux"
                       "--disable-netbeans"
                       "--disable-gpm"

                       "--with-x"
                       "--with-features=huge")
       '(gmake)
       '(gmake install)
       '(gmake clean)
       '(gmake distclean)))
    (else
     (system
       `(./configure   ,(string-append
                          "--prefix=" tynnyri)
                       "--cache-file=/dev/null"
                       "--with-features=huge"
                       "--enable-multibyte"
                       "--enable-perlinterp"
                       "--enable-pythoninterp"
                       ; "--enable-mzschemeinterp"
                       "--enable-xim"
                       "--enable-fontset"
                       "--disable-darwin"
                       "--disable-selinux"
                       "--with-x"
                       "--with-features=huge")
       '(make)
       '(make install)
       '(make clean)
       '(make distclean)))))

