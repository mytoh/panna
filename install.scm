(use file.util)

(define *panna-directory*
  (build-path (home-directory)
              ".panna"))



(define install
  (lambda ()
    (print "creating panna directory")
    (make-directory*
      *panna-directory*)
    (print "copying library directory")
    (copy-directory*
      "kirjasto"
      (build-path *panna-directory*
                  "kirjasto"))
    (print "creating bin/ directory")
    (make-directory*
      (build-path *panna-directory*
                  "bin"))
    (print "linking run script")
    (sys-symlink
      (build-path *panna-directory*
                  "kirjasto/run-panna.scm")
      (build-path *panna-directory*
                  "bin/panna"))
    (print "change run script to executable")
    (sys-chmod
      (build-path *panna-directory*
                  "kirjasto/run-panna.scm")
      764)))

(define (main args)
(cond
  ((file-exists? (build-path (home-directory) ".panna"))  
   (print "please remove ~/.panna directory"))
  (else
    (install)))) 
