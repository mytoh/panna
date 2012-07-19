
(use panna.kaava)

(kaava   "feh")
(homepage "feh.finalrewiond.org")
(repository   "git://derf.homelinux.org/feh" )

(cond
  ; freebsd
  ((is-freebsd)
   (define (install tynnyri)
     (system
       '(gmake clean))
     (add-environment-variable "PREFIX" tynnyri)
     (add-environment-variable "CPPFLAGS" "-I/usr/local/include")
     (add-environment-variable "LDFLAGS"   "-L/usr/local/lib")
     (with-clang)
     (system
       '(gmake)
       '(gmake install))))

  (else
    (define (install tynnyri)
      (sys-putenv (string-append "PREFIX=" tynnyri))
      (with-clang)
      (system
        '(make clean)
        '(make)
        '(make install)))))

