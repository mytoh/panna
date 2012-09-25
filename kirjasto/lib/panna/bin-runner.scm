
;; -*- coding: utf-8 -*-

(define-module panna.bin-runner
  (export
    bin-runner)
  (use gauche.process)
  (use gauche.parseopt)
  (use gauche.parameter)
  (use util.match)
  (use file.util)
  (require-extension (srfi 98))
  (use panna))
(select-module panna.bin-runner)


(define (usage)
  (exit 0
        (string-append
          "usage: ~a <command> <package>\n"
          "\n"
          (format #f "    ~@a ~@a" (colour-string 15 "install")   "- install packages\n")
          (format #f "    ~@a ~@a" (colour-string 15 "update,up") "- update repository\n")
          (format #f "    ~@a ~@a" (colour-string 15 "edit")      "- edit recipe file\n")
          (format #f "    ~@a ~@a" (colour-string 15 "list,ls")   "- list installed packages\n")
          )
        *program-name*))

(define (bin-runner args)
  (let-args (cdr args)
    ((search "S|search")
     (prefix "prefix" )
     (help "h|help")
     (else (opt rest cont)
       (print (string-append (colour-string 1 "Unknown option: ")
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
              ((or "asentaa" "ase")
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


