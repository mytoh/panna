

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
  (tree->string `("[38;5;" ,colour-number "m" ,str "[0m")))

(define-syntax define-colours
  (syntax-rules ()
    ((_ (name colour))
     (define name (make-parameter colour)))
    ((_ (name colour) ...)
     (begin
       (if (number? colour)
         (define name (make-parameter colour))
         (define name colour))  
       ...))))


(define-colours (colour-package           27)
                (colour-message           177)
                (colour-command           50)
                (colour-path              90)
                (colour-symbol1           221)
                (colour-symbol2           99)
                (colour-info              204)
                (colour-info-homepage     62)
                (colour-info-repository   186)
                (colour-info-package      colour-package))


