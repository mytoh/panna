

(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)

(define (help)
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
  (print args)
  (help (cdr args)))
