
(use file.util)
(use panna)
(use gauche.parameter)
(use srfi-1)
(use maali)

(define (unlink pullo)
  (let* ((kaava  (make-parameter pullo))
         (tynnyri-kansio (make-parameter (build-path (kellari-kansio) (kaava)))))

    (display (paint  ">>> " (colour-symbol2)))
    (print (paint  "unlink files" (colour-message)))
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
      ; (append-map cdr file-list))
      )))


(define (uninstall pullo)
  (unlink pullo)
  (let* ((kaava  (make-parameter pullo))
         (tynnyri-kansio (make-parameter (build-path (kellari-kansio) (kaava)))))

    (display (paint  ">>> " (colour-symbol2)))
    (print (paint  "uninstalling files" (colour-message)))
    (let ((file-list
            (directory-fold
              (tynnyri-kansio)
              (lambda (path seed)
                (cons (list path
                            (string-append
                              (panna-kansio)
                              (string-scan path
                                           (tynnyri-kansio)
                                           'after)))
                      seed))
              '())))
      (for-each
        (lambda (p)
          (let ((dir (sys-dirname p)))
            (when (null? (directory-list dir :children? #t))
              (if (file-is-directory? dir)
                (remove-directory* dir)))))
        (receive (a lst) (unzip2 file-list) lst)))

    (display (paint  ">>> " (colour-symbol2)))
    (print (paint  "removing source directory" (colour-message)))
    (when (file-is-directory? (build-path (riisi-kansio) (kaava)))
      (remove-directory* (build-path (riisi-kansio) (kaava))))))

(define (main args)
  (uninstall (cadr args)))
