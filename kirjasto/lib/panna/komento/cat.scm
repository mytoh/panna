
(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)

(define (cat args)
  (call-with-input-file
    (find-file-in-paths
      (string-append (car args) ".scm")
      :paths `(,(kaava-kansio))
      :pred file-is-readable?)
    (lambda (p)
      (with-input-from-port p
        (lambda ()
          (port-for-each
            (lambda (line)
              (print line))
            read-line))))))

(define (main args)
  (cat (cdr args)))
