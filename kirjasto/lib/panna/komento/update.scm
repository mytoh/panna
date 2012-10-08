
(use file.util)
(use util.match)
(use srfi-1)
(use gauche.parameter)
(use gauche.process)

(use panna)
(use maali)


(define (vcs-directory dir)
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
     'bzr)))

(define (git-update dir)
  (let ((pout (process-output->string '(git pull --rebase))))
    (cond
      ((string=? pout "Current branch master is up to date.")
       (sys-select #f #f #f 100000)
       (display "\r")
       (run-process '(tput el1) :wait #t)
       (message "none to update ")
       (display (paint  (last (string-split dir "/")) (colour-package)))
       (newline)
       (flush)
       (sys-select #f #f #f 100000))
      (else
        (newline)
        (message "Updated ")
        (display (paint (last (string-split dir "/")) 194))
        (flush)
        (newline)
        (print pout)
        (flush)))))


(define (update-repo dir)
  (current-directory dir)
  (display (paint  ">> " (colour-symbol1)))
  (flush)
  (display (paint "Updating " 114))
  (flush)
  (display (paint  (last (string-split dir "/")) (colour-package)))
  (flush)
  (ecase (vcs-directory dir)
    ((hg)
     (commands
       '(hg pull)
       '(hg update)))
    ((git)
     (git-update dir))
    ((svn)
     (commands
       '(svn --non-interactive --trust-server-cert update)))
    ((bzr)
     (commands
       '(bzr update)))
    ((cvs)
     (commands
       '(cvs update)))))

(define (update-panna)
  (current-directory (panna-kansio))
  (message  "updating panna repository")
  (newline)
  (flush)
  (commands '(git pull)))

(define (update . pullo)
    (cond
      ((not (null-list? pullo))
       ;; update one repository
       (let ((riisi (build-path (riisi-kansio) (car pullo))))
         ; update panna
         (update-panna)
         (update-repo riisi)))
      ;; update all repositories
      (else
        (let* ((repos  (directory-list (riisi-kansio) :children? #t :add-path? #t)))
          ; update panna
          (update-panna)
          (for-each
            (lambda (repo)
              (update-repo repo))
            repos)))))


(define (main args)
  (match (length (cdr args))
    (1 (update (cadr args)))
    (0 (update))))

