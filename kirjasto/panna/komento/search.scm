
(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use util.list)
(require-extension
  (srfi 1))
(use panna)

(define (search pullo)
  (let ((display-packages (lambda (p)
                            (display (path-sans-extension p))
                            (display " "))))

    (display (colour-string (colour-symbol1) ":: "))
    (display (colour-string (colour-message) "found packages"))
    (newline)
    (map display-packages
         (filter
           (lambda (p) (string-scan p pullo))
           (directory-list (kaava-kansio) :children? #t)))
    (newline)))

(define (search-all)
  (let ((display-packages (lambda (p)
                            (display (path-sans-extension p))
                            (display "\t")))
        (file-lst (directory-list (kaava-kansio) :children? #t)))

    (let loop ((lst file-lst))
      (if (null? lst)
        '()
        (begin
          (map display-packages
               (take* lst 4)) 
          (newline)
          (loop (drop* lst 4)))))))


(define (main args)
  (cond
    ((null-list? (cdr args))
     (search-all))
    (else
      (search (cadr args)))))
