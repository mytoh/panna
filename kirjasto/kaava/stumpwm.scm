(use panna.kaava)

(kaava "stumpwm")
(homepage "github.com/sabatts/stumpwm")
(repository "git://github.com/sabatts/stumpwm")

(define (install tynnyri)
  (with-usr-local)
  (with-clang)
  (system
    '(autoconf)
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)))

