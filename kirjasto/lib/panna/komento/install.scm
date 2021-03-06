(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)
(use maali)


(define (link pullo)
  (let* ((kaava  (make-parameter pullo))
         (tynnyri-kansio (make-parameter (build-path (kellari-kansio) (kaava)))))
    (current-directory (panna-kansio))
    (newline)
    (display (paint  ":: " (colour-symbol1)))
    (print (paint  "symlinking files" (colour-message)))
    (letrec ((relative-path
               (lambda (p)
                 (fold
                   (lambda (e str)
                     (string-append "../" str))
                   (simplify-path
                     (string-append
                       "."
                       (string-scan p
                                    (panna-kansio)
                                    'after)))
                   (string-split
                     (sys-dirname
                       (simplify-path
                         (string-append
                           "."
                           (string-scan p
                                        (tynnyri-kansio)
                                        'after))))
                     #/\//))))
             (file-list
               (directory-fold
                 (tynnyri-kansio)
                 (lambda (path seed)
                   (cons (list (relative-path path)
                               (simplify-path (string-append "." (string-scan path (tynnyri-kansio) 'after))))
                         seed))
                 '())))
      (for-each
        (^p
          (unless (file-exists? (sys-dirname (cadr p)))
            (make-directory* (sys-dirname (cadr p))))
          (unless  (or (file-exists? (cadr p))
                     (string=? (if (path-extension (cadr p))
                                 (path-extension (cadr p))
                                 "")
                               "old"))
            (begin
              (format (current-output-port)
                      "~a\r"
                      (string-append (paint  "linking file " (colour-message))
                                     (paint (cadr  p) (colour-path))))
              (flush)
              (sys-select #f #f #f 90000)
              (sys-symlink (car p)
                           (cadr p)))))
        file-list))))

(define (fetch repository-url pullo)
  (let* ((command-message
           (lambda ()
             (display (paint  ":: " (colour-symbol1)))
             (display (paint  "fetching repository" (colour-message)))
             (newline))))
    (command-message)
    (cond
      ((list? repository-url)
       (case (cadr repository-url)
         ((hg) (cond
                 ((> (length repository-url) 2)
                  (run-process `(hg clone ,@(caddr repository-url) ,(car repository-url) ,pullo)
                               :wait #t
                               :output :null
                               :directory (riisi-kansio)))
                 (else
                   (run-process `(hg clone ,(car repository-url) ,pullo)
                                :wait #t
                                :output :null
                                :directory (riisi-kansio)))))
         (else
           (print "this repository url is not supported"))))
      (else
        (cond
          ((url-is-git? repository-url)
           (run-process `(git clone --depth 1 ,repository-url ,pullo)
                        :wait #t
                        :output :null
                        :directory (riisi-kansio)))
          ((url-is-hg? repository-url)
           (run-process `(hg clone ,repository-url ,pullo)
                        :wait #t
                        :output :null
                        :directory (riisi-kansio)))
          ((url-is-bzr? repository-url)
           (run-process `(bzr branch ,(subseq repository-url 6) ,pullo)
                        :wait #t
                        :output :null
                        :directory (riisi-kansio)))
          ((url-is-svn? repository-url)
           (run-process `(svn --non-interactive --trust-server-cert checkout ,repository-url ,pullo)
                        :wait #t
                        :output :null
                        :directory (riisi-kansio)))
          ((url-is-cvs? repository-url)
           (run-process `(cvs -qd ,(subseq repository-url 6) co -PA ,pullo)
                        :wait #t
                        :directory (riisi-kansio)))
          ((url-is-fossil? repository-url)
           (receive (#f #f scheme #f url #f #f)
             (uri-parse repository-url)
             (run-process `(fossil clone ,(string-append scheme ":" url) ,pullo) :wait #t
                          :directory (riisi-kansio))))
          (else
            (print "this repository url is not supported")))))))

(define (install-package pullo)
  (let* ((tynnyri (build-path (kellari-kansio) pullo))
         (riisi   (build-path (panna-kansio) "riisi" pullo)))
    (load-build-file pullo (kaava-kansio))
    (display (paint  ":: " (colour-symbol1)))
    (display (string-append (paint  "installing "  (colour-message))
                            (paint   pullo (colour-package))))
    (newline)
    (unless (file-is-directory? riisi)
      (fetch (repository) pullo))
    (current-directory riisi)
    (newline)
    (install tynnyri)
    (link pullo)
    ;; no error
    (guard (exc (#t (values)))
      (when (procedure? caveats)
        (display (paint  ":: " (colour-symbol1)))
        (display (paint  "Caveats" (colour-message)))
        (newline)
        (caveats)))

    (newline)))



(define (main args)
  (when (>=  (length (cdr args)) 2)
    (begin
      (display (paint  "::" (colour-symbol1)))
      (display " installing these packages" )
      (newline)
      (for-each (lambda (x)  (display (string-append x " " ))) (cdr args))
      (newline)))
  (let loop ((pulloa (cdr args)))
    (cond
      ((null? pulloa)
       '())
      (else
        (install-package (car pulloa))
        (loop (cdr pulloa))))))
