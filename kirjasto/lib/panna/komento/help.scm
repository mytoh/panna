

(use gauche.parameter)
(use gauche.process)
(use gauche.sequence)
(use file.util)
(use rfc.uri)
(use srfi-13)
(use panna)
(use maali)

(define (help)
  (exit 0
        (string-append
          "usage: panna <command> <package>\n"
          "\n"
          (desc "cat"  "; display build file\n")
          (desc "clean"  "; clean source directory\n")
          (desc "edit"  "; edit recipe file\n")
          (desc "help"  "; display this message\n")
          (desc "info"  "; information about package\n")
          (desc "install"  "; install packages\n")
          (desc "list,ls"  "; list installed packages\n")
          (desc "search"  "; search package or available packages\n")
          (desc "uninstall"  "; uninstall package\n")
          (desc "update,up"  "; update repository\n")
          )))

(define (desc cmd mes)
  (format #f "    ~@a ~@a" (paint (string-pad-right cmd 9) 5 ) (paint mes 223 )))

(define (main args)
  (help))
