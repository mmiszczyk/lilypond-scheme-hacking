% combines shell execution with file reading
% to get something like an interactive shell
#(define s "")
#(system "echo TEST > /tmp/qwertyasdf")
#(let*  ((f (open-input-file "/tmp/qwertyasdf"))
        (c #\space))
  (while (not (eof-object? c))
  (set! s (string-append s (string c)))
  (set! c (read-char f))))
\new Staff <<{g^#s
}>>
