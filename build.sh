#!/bin/bash

# Build README
echo "README.txt -> README.md"
pp \
    -html \
    -import=tufte-markdown.pp \
    README.txt \
    >README.md

# Build sample handout HTML
echo "sample-handout.txt -> sample-handout.html"
pp \
    -html \
    -import=tufte-markdown.pp \
    sample-handout.txt | \
pandoc \
    --standalone \
    --template=templates/tufte.html5 \
    --no-highlight \
    --output=sample-handout.html

# Build sample handout PDF
# tufte-handout supports section and subsection only
echo "sample-handout.txt -> sample-handout.pdf"
pp \
    -pdf \
    -import=tufte-markdown.pp \
    sample-handout.txt | \
pandoc \
    --from=markdown+raw_tex \
    --pdf-engine=xelatex \
    --template=templates/tufte-handout.latex \
    --no-highlight \
    --shift-heading-level-by=-1 \
    --metadata=documentclass:tufte-handout \
    --metadata=CJKmainfont:"Noto Serif CJK SC" \
    --output=sample-handout.pdf
