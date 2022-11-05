#!/bin/bash
echo "Converting README"
pp README.pp.md > README.md

echo "Converting to HTML"
pp -html -import=macros/main.pp sample-handout.pp.md \
  | pandoc -d ./defaults/html.yml -o sample-handout.html

echo "Converting to PDF"
pp -pdf -import=macros/main.pp sample-handout.pp.md \
  | pandoc -d ./defaults/pdf.yml -o sample-handout.pdf
