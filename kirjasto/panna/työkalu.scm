
(define-module panna.työkalu
  (use gauche.process)
  (use gauche.parameter)
  (use file.util)
  (use text.tree)
  (require-extension (srfi 98))
  (export
    load-build-file
    colour-string
    commands
    url-is-git?
    ))
(select-module panna.työkalu)


(define-constant kaava-kansio
  ; directory contains panna build file
  (build-path (sys-getenv "OLUTPANIMO")
              "kirjasto"
              "kaava"))

(define (load-build-file pullo)
  ; find, load kaava file
  (load (find-file-in-paths (string-append pullo ".scm")
                            :paths `(,kaava-kansio)
                            :pred file-is-readable?)))

(define-syntax commands
  ; run processes
  (syntax-rules ()
    ((_ c1 ...)
     (begin
       (run-process c1 :wait #t)
       ...))))

(define (colour-string colour-number str)
  ;; take any -> return string
  (tree->string `("[38;5;" ,(x->string colour-number) "m" ,(x->string str) "[0m")))
(provide "panna.työkalu")

(define (url-is-git? url)
  (cond ((rxmatch->string #/^git:\/\// url) #t)
        ((rxmatch->string #/\.git$/ url) #t)
        (else #f)))
