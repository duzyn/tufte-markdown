#!/bin/bash

# Build README
pp \
    -html \
    -import=tufte-markdown.pp \
    README.ppmd \
    >README.md

# Build sample handout HTML
pp \
    -html \
    -import=tufte-markdown.pp \
    sample-handout.ppmd | \
pandoc \
    --standalone \
    --template=templates/tufte.html5 \
    --no-highlight \
    --output=sample-handout.html

# Build sample handout PDF
# tufte-handout supports section and subsection only
pp \
    -pdf \
    -import=tufte-markdown.pp \
    sample-handout.ppmd | \
pandoc \
    --from=markdown+raw_tex \
    --pdf-engine=xelatex \
    --template=templates/tufte-handout.tex \
    --no-highlight \
    --shift-heading-level-by=-1 \
    --metadata=documentclass:tufte-handout \
    --metadata=CJKmainfont:"Noto Serif CJK SC" \
    --output=sample-handout.pdf
