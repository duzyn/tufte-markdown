#!/bin/bash

# Build README
buildReadme() {
    echo "README.txt -> README.md"
    pp  -html \
        -import=tufte-markdown.pp \
        README.txt \
        >README.md
}

# Build sample handout HTML
buildHtml() {
    echo "sample-handout.txt -> sample-handout.html"
    pp  -html \
        -import=tufte-markdown.pp \
        sample-handout.txt | \
    pandoc --from=markdown \
        --to=html5 \
        --standalone \
        --no-highlight \
        --css=https://cdn.jsdelivr.net/gh/duzyn/duzyn.github.io/assets/css/blog.css \
        --variable=include-before:"<article> <section>" \
        --variable=include-after:"</section> </article>" \
        --output=sample-handout.html
}

# Build sample handout PDF
# tufte-handout supports section and subsection only
buildPdf() {
    echo "sample-handout.txt -> sample-handout.pdf"
    pp  -pdf \
        -import=tufte-markdown.pp \
        sample-handout.txt | \
    pandoc --from=markdown+raw_tex \
        --pdf-engine=xelatex \
        --template=templates/tufte-handout.latex \
        --no-highlight \
        --shift-heading-level-by=-1 \
        --metadata=documentclass:tufte-handout \
        --metadata=CJKmainfont:"Noto Serif CJK SC" \
        --output=sample-handout.pdf
}

buildReadme
buildHtml
buildPdf
