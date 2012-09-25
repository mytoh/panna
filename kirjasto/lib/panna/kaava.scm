
(define-module panna.kaava
  (extend file.util)
  (use gauche.parameter)
  (use gauche.process)
  (use panna)
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

(define (with-clang)
  (sys-setenv "CC" "clang" #t)
  (sys-setenv "CPP" "clang-cpp" #t)
  (sys-setenv "CXX" "clang++" #t)
  (sys-setenv "CXXCPP" "clang-cpp" #t)
  (sys-setenv "OBJC" "clang" #t)

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
    ((_ c )
     (begin
       ; (display "[38;5;99m>>> [0m")
       (display (colour-string (colour-symbol2) ">>> "))
       (for-each (lambda (s) (display (colour-string (colour-command) #`",s "))) c)
       (newline)
       (let* ((p (run-process c :wait #t))
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