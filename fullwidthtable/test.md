7\. Full-width tables

!ifeq(!format)(pdf)
(
!sh(python ./fullwidthtable.py ./table-example.csv -a lcr -c "This is a table caption")
)

!ifeq(!format)(html)
(
!sh(csv2html ./table-example.csv --table 'class="fullwidth"' )
)

This is a example about fullwidth tables in Tufte Handout.

You can build PDF file with:

```
pp -pdf test.md | pandoc -o test.pdf -f markdown+raw_tex --pdf-engine=xelatex \
--template=../templates/tufte-handout.tex -V documentclass:tufte-handout
```

You can build HTML file with:

```
pp -html test.md | pandoc -o test.html -f markdown+raw_tex -t html5 -s \
--template=../templates/tufte-handout.html -c ../tufte-css/latex.css -c ../tufte-css/tufte.css
```