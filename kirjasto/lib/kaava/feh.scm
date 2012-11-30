
(use panna.kaava)

(kaava   "feh")
(homepage "feh.finalrewiond.org")
(repository   "git://derf.homelinux.org/feh" )

(define (install tynnyri)
  (cond
    ; freebsd
    ((is-freebsd)
     (system
       '(gmake clean))
     (add-environment-variable "PREFIX" tynnyri)
     (add-environment-variable "CPPFLAGS" "-I/usr/local/include")
     (add-environment-variable "LDFLAGS"   "-L/usr/local/lib")
     (system
       '(gmake)
       '(gmake install)))

    (else
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (system
        '(make clean)
        '(make)
        '(make install))))) 

