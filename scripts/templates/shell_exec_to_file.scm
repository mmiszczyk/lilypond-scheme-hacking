; executes a shell command from variable shellcmd
; and outputs to file in variable shellout
(system (string-append shellcmd " > " shellout))
