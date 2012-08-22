#!/usr/bin/env gosh
;; -*- coding: utf-8 -*-

;   .-----.---.-.-----.-----.---.-.
;   |  _  |  _  |     |     |  _  |
;   |   __|___._|__|__|__|__|___._|
;   |_|
;   pannaa sina olutta
;
;   package management with gauche scheme
;   maybe similar to homebrew, pacman, emerge
;
; first set environment variable
; $OLUTPANIMO, and set $OLUTPANIMO/bin to $PATH
;
; terms:
; kaava    - build file name    - $OLUTPANIMO/kirjasto/kaava/foo
; riisi    - source directory                      - $HOME/local/git/foo
; panna    - panna directory, all files here       - $OLUTPANIMO
; tynnyri  - package install prefix directory      - $OLUTPANIMO/kellari/foo
; kellari  - all tynnyri goes under this directory - $OLUTPANIMO/kellari
;
; commands:
; install    - function you have to define normally
; update,up  - update one package or all
; edit       - edit kaava with $EDITOR or vim
; list,ls    - list installed package
;


(use gauche.process)
(use gauche.parseopt)
(use gauche.parameter)
(use util.match)
(use file.util)
(require-extension (srfi 98))
(use panna)


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

(define (main args)
  (let-args (cdr args)
    ((search "S|search")
     (prefix "prefix" )
     (#f "h|help" => usage)
     (else (opt . _) (print "Unknown option :" opt) (usage))
     . rest)
    (if (null-list? (cdr args))
      (usage)
      (let* ((komento-directory
               (build-path (sys-getenv "OLUTPANIMO")
                           "kirjasto/panna/komento/"))
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
                                                      (sys-getenv "OLUTPANIMO")
                                                      "kirjasto/panna/komento/"
                                                      (path-swap-extension c "scm"))
                                                   ,@kaava)
                                            :wait #t)
                          (run-process `(gosh ,(build-path
                                                      (sys-getenv "OLUTPANIMO")
                                                      "kirjasto/panna/komento/install.scm")
                                                   ,@rest)
                                            :wait #t)
                          ))
                        (else 
                          (if (file-exists? (build-path komento-directory
                                                        (path-swap-extension c "scm")))
                          (run-process `(gosh ,(build-path
                                                 komento-directory
                                                     (path-swap-extension c "scm")))
                                           :wait #t)
                          (run-process `(gosh ,(build-path
                                                     (sys-getenv "OLUTPANIMO")
                                                     "kirjasto/panna/komento/install.scm")
                                              ,@rest)
                                           :wait #t)
                          ))))))
        (cond
          (search (panna "search"))
          (prefix (print (get-environment-variable "OLUTPANIMO")))
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
              (_ (panna (car rest)))))))))
  0)

