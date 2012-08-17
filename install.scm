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
    (sys-rename
      (build-path *panna-directory*
                  "kirjasto/run-panna.scm")
      (build-path *panna-directory*
                  "bin/panna"))
    (run-process `(chmod +x ,(build-path *panna-directory* "bin/panna")) :wait #t)
    ))


; (define install
;   (lambda ()
;     (print "creating panna directory")
;     (make-directory*
;       *panna-directory*)
;
;     (print "copying library directory")
;     (copy-directory*
;       "kirjasto"
;       (build-path *panna-directory*
;                   "kirjasto"))
;
;     (print "creating bin/ directory")
;     (make-directory*
;       (build-path *panna-directory*
;                   "bin"))
;
;     (print "creating riisi directory")
;     (make-directory*
;       (build-path *panna-directory*
;                   "riisi"))
;
;     (print "linking run script")
;     (sys-symlink
;       (build-path *panna-directory*
;                   "kirjasto/run-panna.scm")
;       (build-path *panna-directory*
;                   "bin/panna"))
;
;     (print "install executable")
;     (sys-rename
;       (build-path *panna-directory*
;                   "kirjasto/run-panna.scm")
;       (build-path *panna-directory*
;                   "bin/panna"))
;     (run-process `(chmod +x ,(build-path *panna-directory* "bin/panna")) :wait #t)
;     ))

(define (main args)
  (cond
    ((file-exists? (build-path (home-directory) ".panna"))
     `(format #f "please remove %s directory" ,(sys-getenv "OLUTPANIMO")))
    (else
      (install))))
