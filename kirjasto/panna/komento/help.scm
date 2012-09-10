

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
          (format #f "    ~@a ~@a" (colour-string 5 "cat")       (colour-string 223 "    display build file\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "clean")       (colour-string 223 "    clean source directory\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "edit")      (colour-string 223 "     edit recipe file\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "help")      (colour-string 223 "    display this message\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "info")       (colour-string 223 "    information about package\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "install")   (colour-string 223 "  install packages\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "list,ls")   (colour-string 223 "  list installed packages\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "search")       (colour-string 223 "    search package or available packages\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "uninstall")       (colour-string 223 "    uninstall package\n"))
          (format #f "    ~@a ~@a" (colour-string 5 "update,up") (colour-string 223 "update repository\n"))
          )
        *program-name*))

(define (main args)
  (help))
