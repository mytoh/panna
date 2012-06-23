(use panna.kaava)

(define kaava  "vim")
(define repository "https://vim.googlecode.com/hg/")

(define (install tynnyri)
  (with-clang)
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
  '(gmake)
  '(gmake install)
  '(gmake clean)
  '(gmake distclean)
  ))

