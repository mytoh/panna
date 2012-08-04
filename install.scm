(use file.util)
(use gauche.process)

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

   (print "creating riisi directory") 
   (make-directory*
     (build-path *panna-directory*
                 "riisi"))

    (print "linking run script")  
    (sys-symlink
      (build-path *panna-directory*
                  "kirjasto/run-panna.scm")
      (build-path *panna-directory*
                  "bin/panna")) 
    (print "install executable")  

    (run-process  `(install -c -s  -m 0755 
              -o  ,(sys-getenv "USER")
              ,(build-path *panna-directory*
                           "kirjasto/run-panna.scm")
              ,(build-path *panna-directory* "bin" ))
                  :wait #t) 
    (sys-rename
      (build-path *panna-directory*
                  "kirjasto/run-panna.scm")
      (build-path *panna-directory*
                  "bin/panna"))
    ))

(define (main args)
  (cond
    ((file-exists? (build-path (home-directory) ".panna"))  
     `(format #f "please remove %s directory" ,(sys-getenv "OLUTPANIMO")))
    (else
      (install)))) 
