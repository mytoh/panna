

(use panna.kaava)

(kaava   "ag")
(homepage "github.com/ggreer/the_silver_searcher")
(repository   "git://github.com/ggreer/the_silver_searcher" )

(define (install prefix)
  (with-clang)
  (with-usr-local)
  (system
    '(./build.sh)
    `(./configure ,(string-append "--prefix=" prefix))
    '(make install)))

