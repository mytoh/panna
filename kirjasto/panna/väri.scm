

(define-module panna.väri
(use gauche.parameter)
(use file.util)
(use text.tree)
(export
  colour-string

  colour-package
  colour-message
  colour-command
  colour-path
  colour-symbol1
  colour-symbol2

  colour-info
  colour-info-package
  colour-info-homepage
  colour-info-repository
  ))
(select-module panna.väri)


(define (colour-string colour-number str)
  ;; take any -> return string
  (tree->string `("[38;5;" ,(x->string colour-number) "m" ,(x->string str) "[0m")))


(define colour-package (make-parameter 4))
(define colour-message (make-parameter 177))
(define colour-command (make-parameter 50))
(define colour-path    (make-parameter 90))
(define colour-symbol1 (make-parameter 155))
(define colour-symbol2 (make-parameter 99))

(define colour-info             (make-parameter 204))
(define colour-info-package     colour-package)
(define colour-info-homepage    (make-parameter 62))
(define colour-info-repository  (make-parameter 186))


