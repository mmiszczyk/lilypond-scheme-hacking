%reads /etc/passwd entries (your by default, but can get other users by uid as well)

\score {
c^#(object->string(getpwuid (getuid)))
}
\layout {}
