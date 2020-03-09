#!/bin/bash

# Build README
pp -html -import=./pp-macros/html/common/today.html.pp README.pp.md >README.md

# Build sample handout PDF
pp -pdf -import=./pp-macros/all.pp sample-handout.md | \
pandoc -o sample-handout.pdf -f markdown+raw_tex --pdf-engine=xelatex \
--template=./templates/tufte-handout.tex -V documentclass=tufte-handout \
--no-highlight -V CJKmainfont="Noto Serif CJK SC"

# Build sample handout HTML
pp -html -import=./pp-macros/all.pp sample-handout.md | \
pandoc -o sample-handout.html -s --template=./templates/tufte.html5 \
--no-highlight

# Build common PDF
pp -pdf -import=./pp-macros/common.pp ./test/common.md | \
pandoc -o ./test/common.pdf -f markdown+raw_tex --template=default.latex \
--pdf-engine=xelatex -V graphics=true \
-V strikeout=true -V "header-includes=\usepackage{soul}" \
-V "header-includes=\usepackage{color}"

# Build common HTML
pp -html -import=./pp-macros/common.pp ./test/common.md | \
pandoc -o ./test/common.html -t html5 -s \
-c https://cdnjs.cloudflare.com/ajax/libs/marx/3.0.3/marx.min.css \
-V "include-before=<main>" -V "include-after=<//main>"