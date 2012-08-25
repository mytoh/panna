
(use file.util)
(use util.match)
(use srfi-1)
(use gauche.parameter)
(use gauche.process)

(use panna)

(define (update . pullo)
  (let* ((vcs-directory
           (lambda (dir)
             (cond
               ((file-exists? (build-path dir ".hg"))
                'hg)
               ((file-exists? (build-path dir ".git"))
                'git)
               ((file-exists? (build-path dir ".svn"))
                'svn)
               ((file-exists? (build-path dir "CVS"))
                'cvs)
               ((file-exists? (build-path dir ".bzr"))
                'bzr)))))
    (cond
      ((not (null-list? pullo))
       ; update one repository
       (let ((riisi (build-path (riisi-kansio) (car pullo))))
         ; update panna
         (current-directory (panna-kansio))
         (message  "updating panna repository")
         (newline)
         (commands '(git pull))

         (current-directory riisi)
         (message  "updating ")
         (display (colour-string (colour-package) (last (string-split (current-directory) "/"))))
         (newline)
         (ecase (vcs-directory riisi)
           ((hg)
            (commands
              '(hg pull)
              '(hg update)))
           ((git)
            (commands
              '(git pull --rebase --all)))
           ((svn)
            (commands
              '(svn update)))
           ((bzr)
            (commands
              '(bzr update)))
           ((cvs)
            (commands
              '(cvs update))))))

      ; update all repositories
      (else
        (let* ((repos  (directory-list (riisi-kansio) :children? #t :add-path? #t)))
          ; update panna
          (current-directory (panna-kansio))
          (message  "updating panna repository")
          (newline)
          (commands '(git pull))
          (flush)
          (for-each
            (lambda (repo)
              (current-directory repo)

              (message "updating ")
              (display (colour-string (colour-package) (last (string-split repo "/"))))
              (newline)

              (ecase (vcs-directory (current-directory))
                ((hg)
                 (commands
                   '(hg pull)
                   '(hg update)))
                ((git)
                 (commands
                 '(git pull --rebase)))
                ((svn)
                 (commands
                   '(svn update)))
                ((cvs)
                 (commands
                   '(cvs update)))
                ((bzr)
                 (commands
                   '(bzr update)))))

            repos))))))


(define (main args)
  (match (length (cdr args))
    (1 (update (cadr args)))
    (0 (update))))

