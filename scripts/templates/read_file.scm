; reads file pointed by a inputfilename variable
; output in s variable
; based on https://github.com/jnetterf/hacklily/issues/5#issue-361652697
(define s "")
(let*  ((f (open-input-file inputfilename)) (c #\space)) (while (not (eof-object? c)) (set! s (string-append s (string c))) (set! c (read-char f))))
