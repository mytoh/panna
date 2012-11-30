(use panna.kaava)

(kaava "stumpwm")
(homepage "github.com/sabatts/stumpwm")
(repository "git://github.com/sabetts/stumpwm")

(define (install tynnyri)
  (with-usr-local)
  (system
    '(autoconf)
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)))

