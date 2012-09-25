 

(use panna.kaava)

(kaava  "gettext")
(homepage  "http://gnu.org")
(repository "git://git.savannah.gnu.org/gettext.git")

( define (install tynnyri)  
         ( cond 
           ((is-freebsd)
            (with-clang)
            (system
              '(./autogen.sh)
              `(./configure ,(string-append "--prefix=" tynnyri))
              `(gmake)
              `(gmake install)
              `(gmake clean)
              )
            ) 
           ( else  
             (system
               '(./Util/preconfig)
               `(./configure ,(string-append "--prefix=" tynnyri))
               `(make)
               `(make install)
               `(make clean)
               )))) 
