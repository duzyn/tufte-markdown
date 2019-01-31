---
title: Tufte Handout Sample
author: David Peng
date: 2019-01-31
---

# Tufte Markdown

Tufte Markdown prodives tools to style web articles or paper handouts using the ideas demonstrated by Edward Tufte’s books and handouts. Tufte’s style is known for its simplicity, extensive use of sidenotes, tight integration of graphics with text, and carefully chosen typography.

You can simply write your articles with Markdown, then you can convert them to beautiful HTML and PDF articles using Tufte's style. Here is how-to.

## How to

I combined these tools to archive Tufte Markdown:

- Markdown
- [Pandoc]
- [pp]: a powerful preprocessor with pandoc in mind
- [Tufte CSS]
- [Tufte LaTeX]
- [MiKTeX] or [TeX Live] or [wkhtmltopdf]

You should download and install [Pandoc] and [pp] first. We get a HTML or PDF file with this process:

1. Write a markdown article including pp macros.
2. Use pp to preprocess the markdown and get a normal markdown file with HTML or LaTeX.
3. Stream the markdown to Pandoc.
4. Use a HTML template and Tufte CSS to get a HTML article.
5. Use a LaTeX template and Tufte LaTeX to get a PDF article with a TeX document production system, like MiKTeX, Tex Live or ConTeXt. You can also generate a HTML file to PDF with wkhtmltopdf.

## Download

You can download it by Git:

    git clone https://github.com/duzyn/tufte-markdown

or download the [archive](https://github.com/duzyn/tufte-markdown/archive/master.zip).

## pp Macros

1\. New thoughts

> In his later books _Beautiful Evidence_, Tufte starts each section with a bit of vertical space, a non-indented paragraph, and the first few words of the sentence set in small caps.

HTML macro:

```c
!define(newthought)
(
<span class="newthought">!1</span>
)
```

LaTeX macro:

```c
!define(newthought)
(
\newthought{!1}
)
```

Usage:

    !newthought(This is a new thought)

2\. Sidenotes

> One of the most distinctive features of Tufte’s style is his extensive use of sidenotes. Sidenotes are like footnotes, except they don’t force the reader to jump their eye to the bottom of the page, but instead display off to the side in the margin. Perhaps you have noticed their use in this document already. You are very astute.

HTML macro:

```c
!define(SIDENOTE)(1)

!define(sidenote)
(
<label for="sidenote-!SIDENOTE" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-!SIDENOTE" class="margin-toggle"/>
<span class="sidenote">!1</span>
!add(SIDENOTE)
)
```

LaTeX macro:

```c
!define(sidenote)
(
\sidenote{!1}
)
```

Usage:

    !sidenote(This is a sidenote)

3\. Margin notes

> If you want a sidenote without footnote-style numberings, then you want a margin note. On large screens, a margin note is just a sidenote that omits the reference number. This lessens the distracting effect taking away from the flow of the main text, but can increase the cognitive load of matching a margin note to its referent text.

HTML macro:

```c
!define(MARGINNOTE)(1)

!define(marginnote)
(
<label for="marginnote-!MARGINNOTE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-!MARGINNOTE" class="margin-toggle"/>
<span class="marginnote">!1</span>
!add(MARGINNOTE)
)
```

LaTeX macro:

```c
!define(marginnote)
(
\marginnote{!1}
)
```

Usage:

    !marginnote(This is a margin note)

4\. Figures

> Tufte emphasizes tight integration of graphics with text. Data, graphs, and figures are kept with the text that discusses them. In print, this means they are not relegated to a separate page. On the web, that means readability of graphics and their accompanying text without extra clicks, tab-switching, or scrolling.

HTML macro:

```c
!define(FIGURE)(1)

!define(figure)
(
<figure>
<label for="figure-!FIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="figure-!FIGURE" class="margin-toggle"/>
<span class="marginnote">!1</span>
<img src="!2" alt="!1" />
</figure>
!add(FIGURE)
)
```

LaTeX macro:

```c
!define(figure)
(
\begin{figure}
\includegraphics{!2}
\caption{!1}
\end{figure}
)
```

Usage:

    !figure(This is a figure caption)(./image/path/image.jpg)

5\. Margin figures

> But tight integration of graphics with text is central to Tufte’s work even when those graphics are ancillary to the main body of a text. In many of those cases, a margin figure may be most appropriate. To place figures in the margin, just wrap an image (or whatever) in a margin note inside a p tag, as seen to the right of this paragraph.

HTML macro:

```c
!define(MARGINFIGURE)(1)

!define(marginfigure)
(
<label for="marginfigure-!MARGINFIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginfigure-!MARGINFIGURE" class="margin-toggle"/>
<span class="marginnote"><img src="!2" alt="!1"/>!1</span>
!add(MARGINFIGURE)
)
```

LaTeX macro:

```c
!define(marginfigure)
(
\begin{marginfigure}
\includegraphics{!2}
\caption{!1}
\end{marginfigure}
)
```

Usage:

    !marginfigure(This is a margin figure caption)(./image/path/image.jpg)

6\. Full-width figures

> If you need a full-width figure, give it the fullwidth class. Make sure that’s inside an article, and it will take up (almost) the full width of the screen. This approach is demonstrated below using Edward Tufte’s English translation of the Napoleon’s March data visualization. From Beautiful Evidence, page 122-124.

HTML macro:

```c
!define(fullwidthfigure)
(
<figure class="fullwidth">
<img src="!2" alt="!1">
</figure>
)
```

LaTeX macro:

```c
!define(fullwidthfigure)
(
\begin{figure*}
\includegraphics{!2}
\caption{!1}
\end{figure*}
)
```

Usage:

    !fullwidthfigure(This is a full-width figure caption)(./image/path/image.jpg)

7\. Full-width text blocks

> Many thanks go to Edward Tufte for leading the way with his work. It is only through his kind and careful editing that this project accomplishes what it does. All errors of implementation are of course mine.

HTML macro:

```c
!define(fullwidth)
(
<div class="fullwidth">
  <p>!1</p>
</div>
)
```

LaTeX macro:

```c
!define(fullwidth)
(
\begin{fullwidth}
!1
\end{fullwidth}
)
```

Usage:

    !fullwidth(This is a full-width text block)

## Use pp to preprocess Markdown

We can use a list of macros defined below to generate a HTML or LaTeX file depend on the format.

```c
!comment(
title:  Tufte Markdown
author: David Peng
date:   2017-06-30
)

!ifeq(!format)(html)
(
!import(html/tufte/newthought.html.pp)
!import(html/tufte/sidenote.html.pp)
!import(html/tufte/marginnote.html.pp)
!import(html/tufte/figure.html.pp)
!import(html/tufte/marginfigure.html.pp)
!import(html/tufte/fullwidthfigure.html.pp)
!import(html/tufte/fullwidth.html.pp)
)

!ifeq(!format)(pdf)
(
!import(pdf/tufte/newthought.pdf.pp)
!import(pdf/tufte/sidenote.pdf.pp)
!import(pdf/tufte/marginnote.pdf.pp)
!import(pdf/tufte/figure.pdf.pp)
!import(pdf/tufte/marginfigure.pdf.pp)
!import(pdf/tufte/fullwidthfigure.pdf.pp)
!import(pdf/tufte/fullwidth.pdf.pp)
)
```

## Use Pandoc to convert Markdown to HTML and PDF

Use like this in bash：

```sh
#!/bin/bash

# Build README
pp -html -import=./pp-macros/html/common/today.html.pp README.pp.md >README.md

# Build sample handout PDF
pp -pdf -import=./pp-macros/all.pp sample-handout.md | \
pandoc -o sample-handout.pdf -f markdown+raw_tex --pdf-engine=xelatex \
--template=./templates/tufte-handout.tex -V documentclass=tufte-handout \
--no-highlight

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
```

## Acknowledgements

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)

## License

Released under the MIT license. See [LICENSE](LICENSE).

[Pandoc]: http://pandoc.org
[pp]: https://github.com/CDSoft/pp
[Tufte CSS]: https://edwardtufte.github.io/tufte-css/
[Tufte LaTeX]: https://tufte-latex.github.io/tufte-latex/
[MiKTeX]: https://miktex.org/
[TeX Live]: https://www.tug.org/texlive/
[wkhtmltopdf]: https://wkhtmltopdf.org