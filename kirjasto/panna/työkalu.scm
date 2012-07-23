
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
  (or (rxmatch #/^git:\/\// url)
        (rxmatch #/\.git$/ url)))

(define (url-is-hg? url)
  (or (rxmatch #/^https?:\/\/(.+?\.)?googlecode\.com\/hg/ url)
        (rxmatch #/^hg:\/\// url)
        (rxmatch #/^http:\/\/hg\./ url)
        (rxmatch #/^http:\/\/(.+?\/)\/hg/ url)))

(define (url-is-svn? url)
  (or (rxmatch #/^https?:\/\/(.+?\.)?googlecode\.com\/svn/ url)
        (rxmatch #/^https?:\/\/(.+?\.)?sourceforge\.net\/svnroot/ url)
        (rxmatch #/^svn:\/\// url)
        (rxmatch #/^svn\+http:\/\// url)
        (rxmatch #/^http:\/\/svn.apache.org\/repos/ url)
        (rxmatch #/^http:\/\/svn\./ url)))

(define (url-is-bzr? url)
  (cond ((rxmatch #/^bzr:\/\// url) #t)
        (else #f)))

(define (url-is-fossil? url)
  (cond ((rxmatch #/^fossil:\/\// url) #t)
        (else #f)))

(define (url-is-cvs? url)
  (cond ((rxmatch #/^cvs:\/\// url) #t)
        (else #f)))
