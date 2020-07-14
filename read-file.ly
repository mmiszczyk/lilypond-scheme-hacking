% this will read a file; in this example, it's /etc/passwd, but it can be anything
% (there are better ways of reading /etc/passwd though)
% this code is based on this: https://github.com/jnetterf/hacklily/issues/5#issue-361652697
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
}
