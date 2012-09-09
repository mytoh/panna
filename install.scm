(use file.util)
(use gauche.process)

(define *panna-directory*
  (if (sys-getenv "OLUTPANIMO")
    (sys-getenv "OLUTPANIMO")
    (build-path (home-directory)
                ".panna")))

(define install
  (lambda ()
    (print "cloning repository")
    (run-process `(git clone git://github.com/mytoh/panna ,*panna-directory*) :wait #t)

    ; (print "creating bin/ directory")
    ; (make-directory*
    ;   (build-path *panna-directory*
    ;               "bin"))

    (print "creating riisi directory")
    (make-directory*
      (build-path *panna-directory*
                  "riisi"))

    (print "make executable")
    (run-process `(chmod +x ,(build-path *panna-directory* "bin/panna")) :wait #t)

    (newline)
    (print "   .-----.---.-.-----.-----.---.-." )
    (print "   |  _  |  _  |     |     |  _  |" )
    (print "   |   __|___._|__|__|__|__|___._|" )
    (print "   |_|            package manager " )
    ))


(define (main args)
  (cond
    ((file-exists? (build-path (home-directory) ".panna"))
     `(format #f "please remove %s directory" ,(sys-getenv "OLUTPANIMO")))
    (else
      (install))))
