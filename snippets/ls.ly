% this lists the contents of a specified directory
#(define s "")
#(begin (define dir (opendir "/tmp"))
   (do ((entry (readdir dir) (readdir dir)))
       ((eof-object? entry))
      (set! s (string-append s entry " | ")))
  (closedir dir))
\score {
c^#s
}
\layout {}
