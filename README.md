# Tufte Markdown

[中文](https://www.pengdaiwu.com/articles/tufte-markdown)

Tufte Markdown providers tools to style web articles or paper handouts using the
ideas demonstrated by Edward Tufte's books and handouts. Tufte's style is known
for its simplicity, extensive use of sidenotes, tight integration of graphics
with text, and carefully chosen typography.

## Usage

Write a markdown article including [pp](https://github.com/CDSoft/pp) macros,
then use pp to preprocess the markdown and pipe it to
[Pandoc](http://pandoc.org), Pandoc convert Markdown to HTML or LaTeX document.

See example [build-sample.sh](build-sample.sh).

You can see a full list of macros in [tufte-markdown.pp](tufte-markdown.pp)

## Read more

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://github.com/rstudio/tufte/blob/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)
