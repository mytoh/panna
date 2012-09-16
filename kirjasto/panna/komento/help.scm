

(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use panna)

(define (help)
  (exit 0
        (string-append
          "usage: panna <command> <package>\n"
          "\n"
          (make-help "cat      "  "; display build file\n")
          (make-help "clean    "  "; clean source directory\n")
          (make-help "edit     "  "; edit recipe file\n")
          (make-help "help     "  "; display this message\n")
          (make-help "info     "  "; information about package\n")
          (make-help "install  "  "; install packages\n")
          (make-help "list,ls  "  "; list installed packages\n")
          (make-help "search   "  "; search package or available packages\n")
          (make-help "uninstall"  "; uninstall package\n")
          (make-help "update,up"  "; update repository\n")
          )))

(define (make-help cmd mes)
  (format #f "    ~@a ~@a" (colour-string 5 cmd) (colour-string 223 mes)))

(define (main args)
  (help))
