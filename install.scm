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
    ))

(define (main args)
(cond
  ((file-exists? (build-path (home-directory) ".panna"))  
   (print "please remove ~/.panna directory"))
  (else
    (install)))) 
