

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
          (format #f "    ~@a ~@a" (colour-string 5 "install")   (colour-string 223 "  install packages\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "update,up") (colour-string 223 "update repository\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "edit")      (colour-string 223 "     edit recipe file\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "list,ls")   (colour-string 223 "  list installed packages\n"))
          )
        *program-name*))

(define (main args)
  (help))
