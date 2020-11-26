## Introduction

This is a collection of code snippets and scripts useful for
attacking vulnerable GNU Lilypond installations. More generally,
it can be used to prepare attack payloads for any vulnerability
which results in injection of Scheme code in the GNU Guile
interpreter, however newer versions of Guile might allow for
easier attacks (e.g. all the tricks which read commands output
by redirecting it to a file and then reading that file are not
necessary in Guile versions which contain the ice-9 popen module.

## Background

Code in this repository was developed during research into
a vulnerability in Score extension for Mediawiki engine. Said
extension allowed rendering musical scores based on ABC or
Lilypond code, with Lilypond backend being run without safe mode.
The issue has been assigned CVE identifier CVE-2020-29007.

Because other sandboxing settings disallowed network connectivity,
the code here doesn't spawn any sort of bind or reverse shell.
Instead, it assumes that the attacker is able to continuously
inject Scheme code and observe resulting output images. Those
assumptions may or may not be true when attacking Lilypond
installations outside of MediaWiki.

## ```snippets/```

Snippets contain example Lilypond code which can perform actions
useful for the attackers - e.g. parsing ```/etc/passwd``` or
executing shell commands and reading their outputs.

## ```scripts/upload_file.py```

This script generates code which uploads a file from disk. It
can optionally execute this file, returning its output in generated
score image. This works in the same manner as
```snippets/execute_binary_file.ly```: file is encoded in base64
and hardcoded into Scheme code, which then decodes it into a file
using shell commands. The file might be then executed. The script
can return Scheme code, Lilypond code or complete Wiki markup.

### Usage

```bash
usage: upload_file.py [-h] [-f {scm,ly,wiki}] [-e] file

Generate Lilypond/Guile/MediaWiki code to upload file to a vulnerable server

positional arguments:
  file                  path to file

optional arguments:
  -h, --help            show this help message and exit
  -f {scm,ly,wiki}, --format {scm,ly,wiki}
                        output format
  -e, --execute         execute file after uploading
```

## ```scripts/templates/```

This directory contains Scheme code templates (similar to those in
the ```snippets/``` directory) used for generating the completed
payload.
