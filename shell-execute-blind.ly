% executes shell command and gets it return code
\score {
c^#(number->string (system "/bin/false"))
}
\layout {}
