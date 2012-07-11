(use panna.kaava)

(define kaava "stumpwm")
(define homepage "http;//github.com/sabatts/stumpwm")
(define repository "git://github.com/sabatts/stumpwm")

(define (install tynnyri)
  (with-usr-local)
  (with-clang)
  (system
    '(autoconf)
    `(./configure ,(string-append "--prefix=" tynnyri))
    '(make)
    '(make install)
    '(make clean)))

