
;; -*- coding: utf-8 -*-

(define-module panna.cli
  (export
    runner)
  (use gauche.process)
  (use gauche.parseopt)
  (use gauche.parameter)
  (use util.match)
  (use file.util)
  (require-extension (srfi 98))
  (use maali)
  (use panna))
(select-module panna.cli)


(define (usage)
  (exit 0
        (string-append
          "usage: ~a <command> <package>\n"
          "\n"
          (format #f "    ~@a ~@a" (paint "install" 15 )   "- install packages\n")
          (format #f "    ~@a ~@a" (paint "update,up" 15 ) "- update repository\n")
          (format #f "    ~@a ~@a" (paint "edit" 15 )      "- edit recipe file\n")
          (format #f "    ~@a ~@a" (paint "list,ls" 15 )   "- list installed packages\n")
          )
        *program-name*))

(define (runner args)
  (let-args (cdr args)
    ((search "S|search")
     (prefix "prefix" )
     (help "h|help")
     (else (opt rest cont)
       (print (string-append (paint "Unknown option: " 1 )
                             opt))
       (cont (list "--help")))
     . rest)
    (let* ((komento-directory
             (build-path (sys-getenv "OLUTPANIMO")
                         "kirjasto/lib/panna/komento/"))
           (kaava (match (length rest)
                    (2 (cdr rest))
                    (1  (if search rest #f))
                    (0 #f)
                    (_ (cdr rest))))
           (panna (lambda (c)
                    (cond
                      (kaava
                        (if (file-exists? (build-path
                                            komento-directory
                                            (path-swap-extension c "scm")))
                          (run-process `(gosh ,(build-path
                                                 komento-directory
                                                 (path-swap-extension c "scm"))
                                              ,@kaava)
                                       :wait #t)
                          (run-process `(gosh ,(build-path
                                                 komento-directory
                                                 "install.scm")
                                              ,@rest)
                                       :wait #t)))
                      (else
                        (if (file-exists? (build-path komento-directory
                                                      (path-swap-extension c "scm")))
                          (run-process `(gosh ,(build-path
                                                 komento-directory
                                                 (path-swap-extension c "scm")))
                                       :wait #t)
                          (run-process `(gosh ,(build-path
                                                 komento-directory
                                                 "install.scm")
                                              ,@rest)
                                       :wait #t)))))))
      (if (null-list? (cdr args))
        (panna "help")
        (cond
          (search (panna "search"))
          (prefix (print (get-environment-variable "OLUTPANIMO")))
          (help   (panna "help"))
          (else
            (match (car rest)
              ; command aliases
              ((or "i" "asentaa" "ase")
               (panna "install"))
              ("up"
               (panna "update"))
              ("ln"
               (panna "link"))
              ("ls"
               (panna "list"))
              ("home"
               (panna "homepage"))
              ((or "rm" "remove")
               (panna "uninstall"))
              ("abv"
               (panna "info"))
              ("env"
               (panna "environment"))
              ("help"
               (panna "help"))
              (_ (panna (car rest)))))))))
  0)


