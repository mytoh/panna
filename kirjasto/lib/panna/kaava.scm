
(define-module panna.kaava
  (extend file.util)
  (use gauche.parameter)
  (use gauche.process)
  (use panna)
  (use maali)
  (require-extension
    (srfi 13))
  (export
    homepage
    repository
    kaava

    system
    get-os-type
    is-freebsd
    add-environment-variable

    with-clang
    with-panna-library
    with-usr-local
    ))
(select-module panna.kaava)

(define kaava (make-parameter "unknown"))
(define homepage (make-parameter "unknown"))
(define repository (make-parameter "unknown"))

(define (setenv-command name command)
  (when (find-file-in-paths command)
    (sys-setenv name command #t)))

(define (with-clang)
  (setenv-command "CC" "clang" )
  (setenv-command "CPP" "clang-cpp")
  (setenv-command "CXX" "clang++")
  (setenv-command "CXXCPP" "clang-cpp")
  (setenv-command "OBJC" "clang")

  (sys-unsetenv "NO_WERROR")
  (sys-unsetenv "WERROR")
  ; disable all warnings
  (add-environment-variable "CXXFLAGS" "-w")
  (add-environment-variable "CFLAGS" "-w"))

(define (with-panna-library)
  (let ((panna (resolve-path (sys-getenv "OLUTPANIMO"))))
    (add-environment-variable
      "CPPFLAGS"
      (string-append
        "-I"
        (build-path panna "include")))
    (add-environment-variable
      "LDFLAGS"
      (string-append
        "-L"
        (build-path panna "lib")))))

(define (with-usr-local)
  (add-environment-variable "CPPFLAGS" "-I/usr/local/include")
  (add-environment-variable "LDFLAGS" "-L/usr/local/lib"))



(define-syntax system
  ; run processes
  (syntax-rules ()
    ((_ c)
     (begin
       ; (display "[38;5;99m>>> [0m")
       (display (paint  ">>> " (colour-symbol2)))
       (for-each (lambda (s) (display (paint  #`",s " (colour-command)))) c)
       (newline)
       (let* ((p (run-process c :wait #t :output :null))
              (status (process-exit-status p)))
         (when (not  (zero? status))
           (error #`"command fail with status ,status" c)))))
    ((_ c1 c2 ...)
     (begin
       (system c1)
       (system c2 ...)))))


(define add-environment-variable
  (lambda (env value)
    (cond
      ((sys-getenv env)
       (sys-setenv
         env
         (string-append
           (sys-getenv env)
           " " value)
         #t)) ; overwrite
      (else
        (sys-setenv env value)))))


(define get-os-type
  ; returns symbol
  (lambda ()
    (string->symbol (string-downcase
                      (car (sys-uname))))))

(define is-freebsd
  (lambda ()
   (eq? (get-os-type) 'freebsd)))
