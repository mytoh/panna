(use file.util)
(use panna)
(use gauche.parameter)
(use srfi-1)

(define (unlink pullo)
  (let* ((kaava  (make-parameter pullo))
         (tynnyri-kansio (make-parameter (build-path (kellari-kansio) (kaava)))))

    (newline)
    (display (colour-string (colour-symbol2) ">>> "))
    (print (colour-string (colour-message) "unlink files"))
    (let ((file-list
            (directory-fold
              (tynnyri-kansio)
              (lambda (path seed)
                (cons (list
                        path
                        (string-append
                          (panna-kansio)
                          (string-scan path
                                       (tynnyri-kansio)
                                       'after)))
                      seed))
              '())))
      (for-each
        remove-files
        (receive (a lst) (unzip2 file-list) lst))

      ; (for-each
      ; remove-files
      ; (append-map cdr file-list ))
      )))

(define (main args)
  (unlink (cadr args)))
