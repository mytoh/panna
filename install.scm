(use file.util)

(define *panna-directory*
  (build-path (home-directory)
              ".panna"))

(cond
  ( (file-exists? (build-path (home-directory) ".panna"))  
   (print "please remove ~/.panna directory"))
  (else
    (install)))


(define install
  (lambda ()
    (print "making panna directory")
    (make-directory*
      *panna-directory*)
    (print "coping library directory")
    (copy-directory*
      "kirjasto"
      *panna-directory*)))
