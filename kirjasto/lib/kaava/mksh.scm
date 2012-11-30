;;; -*- coding: utf-8 -*-

(use panna.kaava)

(kaava "mksh")
(homepage "www.mirbsd.org/mksh.htm")
(repository "cvs://_anoncvs@anoncvs.mirbsd.org:/cvs")

(define (install tynnyri)
  (make-directory* (build-path tynnyri "share/man/man1" ))
  (make-directory* (build-path tynnyri "share/man/cat1" ))
  (system
    '(sh Build.sh)
    `(mkdir -pv ,(build-path tynnyri "bin" ))
    `(install -c -s  -m 555 mksh ,(build-path tynnyri "bin" ))

    `(install -c  -m 444 mksh.cat1 ,(build-path tynnyri "share/man/cat1" ))
    `(install -c  -m 444 mksh.1 ,(build-path tynnyri "share/man/man1" ))
    ))

(define (caveats)
  (print "To allow using mksh as a login shell , run this as root")
  (print "   echo $OLUTPANIMO/bin/mksh >> /etc/shells")
  (print "Then, any user may run `chsh` to change their shell."))
