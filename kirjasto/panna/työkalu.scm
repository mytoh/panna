
(define-module panna.työkalu
  (use gauche.process)
  (use gauche.parameter)
  (use file.util)
  (use text.tree)
  (require-extension (srfi 98))
  (export
    load-build-file
    commands
    url-is-git?
    url-is-hg?
    url-is-bzr?
    url-is-cvs?
    url-is-fossil?
    url-is-svn?
    ))
(select-module panna.työkalu)


(define-constant kaava-kansio
  ; directory contains panna build file
  (build-path (sys-getenv "OLUTPANIMO")
              "kirjasto"
              "kaava"))

(define (load-build-file pullo kansio)
  ; find, load kaava file
  (load (find-file-in-paths (string-append pullo ".scm")
                            :paths `(,kansio)
                            :pred file-is-readable?)))

(define-syntax commands
  ; run processes
  (syntax-rules ()
    ((_ c1 ...)
     (begin
       (run-process c1 :wait #t)
       ...))))


(define (url-is-git? url)
  (cond ((rxmatch #/^git:\/\// url) #t)
        ((rxmatch #/\.git$/ url) #t)
        (else #f)))

(define (url-is-hg? url)
  (cond ((rxmatch #/^https?:\/\/(.+?\.)?googlecode\.com\/hg/ url) #t)
        ((rxmatch #/^hg:\/\// url) #t)
        ((rxmatch #/^http:\/\/hg\./ url) #t)
        ((rxmatch #/^http:\/\/(.+?\/)\/hg/ url) #t)
        (else #f)))

(define (url-is-svn? url)
  (cond ((rxmatch #/^https?:\/\/(.+?\.)?googlecode\.com\/svn/ url) #t)
        ((rxmatch #/^https?:\/\/(.+?\.)?sourceforge\.net\/svnroot/ url) #t)
        ((rxmatch #/^svn:\/\// url) #t)
        ((rxmatch #/^svn\+http:\/\// url) #t)
        ((rxmatch #/^http:\/\/svn.apache.org\/repos/ url) #t)
        ((rxmatch #/^http:\/\/svn\./ url) #t)
        (else #f)))

(define (url-is-bzr? url)
  (cond ((rxmatch #/^bzr:\/\// url) #t)
        (else #f)))

(define (url-is-fossil? url)
  (cond ((rxmatch #/^fossil:\/\// url) #t)
        (else #f)))

(define (url-is-cvs? url)
  (cond ((rxmatch #/^cvs:\/\// url) #t)
        (else #f)))
