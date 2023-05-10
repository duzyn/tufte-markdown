default: update markdown html pdf

update:
    curl -o templates/tufte-handout.tex \
        https://cdn.jsdelivr.net/gh/rstudio/tufte/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex

markdown:
    pp README.pp.md > README.md

html:
    pp -html -import=macros/main.pp sample-handout.pp.md | \
        pandoc -d defaults/html.yml -o index.html

pdf:
    pp -pdf -import=macros/main.pp sample-handout.pp.md | \
        pandoc -d defaults/pdf.yml -o sample-handout.pdf