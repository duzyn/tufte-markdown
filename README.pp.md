# Tufte Markdown

Tufte Markdown providers tools to style web articles or paper handouts using the
ideas demonstrated by Edward Tufte's books and handouts. Tufte's style is known
for its simplicity, extensive use of sidenotes, tight integration of graphics
with text, and carefully chosen typography.

## Usage

Write a markdown article including [pp](https://github.com/CDSoft/pp) macros,
then use pp to preprocess the markdown and pipe it to
[Pandoc](http://pandoc.org), Pandoc convert Markdown to HTML or LaTeX document.

You can see a full list of macros in [main.pp](./macros/main.pp)

!source(macros/main.pp)
!source(macros/tufte/audio.pp)
!source(macros/tufte/figure.pp)
!source(macros/tufte/fullwidth.pp)
!source(macros/tufte/fullwidthfigure.pp)
!source(macros/tufte/fullwidthvideo.pp)
!source(macros/tufte/latex.pp)
!source(macros/tufte/marginfigure.pp)
!source(macros/tufte/marginnote.pp)
!source(macros/tufte/newthought.pp)
!source(macros/tufte/sidenote.pp)
!source(macros/tufte/table.pp)
!source(macros/tufte/video.pp)
!source(macros/html/a.pp)
!source(macros/html/abbr.pp)
!source(macros/html/center.pp)
!source(macros/html/em.pp)
!source(macros/html/flushleft.pp)
!source(macros/html/flushright.pp)
!source(macros/html/img.pp)
!source(macros/html/kbd.pp)
!source(macros/html/mark.pp)
!source(macros/html/newpage.pp)
!source(macros/html/strike.pp)
!source(macros/html/strong.pp)
!source(macros/html/textcolor.pp)
!source(macros/html/today.pp)
!source(macros/html/u.pp)

See example [justfile](./.justfile).

## Read more

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://github.com/rstudio/tufte/blob/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)
