---
title: Tufet Markdown
author: David Peng
date: !today
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

```
!rawinclude(pp-macros/html/tufte/newthought.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/newthought.pdf.pp)
```

Usage:

    !newthought(This is a new thought)

2\. Sidenotes

> One of the most distinctive features of Tufte’s style is his extensive use of sidenotes. Sidenotes are like footnotes, except they don’t force the reader to jump their eye to the bottom of the page, but instead display off to the side in the margin. Perhaps you have noticed their use in this document already. You are very astute.

HTML macro:

```
!rawinclude(pp-macros/html/tufte/sidenote.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/sidenote.pdf.pp)
```

Usage:

    !sidenote(This is a sidenote)

3\. Margin notes

> If you want a sidenote without footnote-style numberings, then you want a margin note. On large screens, a margin note is just a sidenote that omits the reference number. This lessens the distracting effect taking away from the flow of the main text, but can increase the cognitive load of matching a margin note to its referent text.

HTML macro:

```
!rawinclude(pp-macros/html/tufte/marginnote.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/marginnote.pdf.pp)
```

Usage:

    !marginnote(This is a margin note)

4\. Figures

> Tufte emphasizes tight integration of graphics with text. Data, graphs, and figures are kept with the text that discusses them. In print, this means they are not relegated to a separate page. On the web, that means readability of graphics and their accompanying text without extra clicks, tab-switching, or scrolling.

HTML macro:

```
!rawinclude(pp-macros/html/tufte/figure.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/figure.pdf.pp)
```

Usage:

    !figure(This is a figure caption)(./image/path/image.jpg)

5\. Margin figures

> But tight integration of graphics with text is central to Tufte’s work even when those graphics are ancillary to the main body of a text. In many of those cases, a margin figure may be most appropriate. To place figures in the margin, just wrap an image (or whatever) in a margin note inside a p tag, as seen to the right of this paragraph.

HTML macro:

```
!rawinclude(pp-macros/html/tufte/marginfigure.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/marginfigure.pdf.pp)
```


Usage:

    !marginfigure(This is a margin figure caption)(./image/path/image.jpg)

6\. Full-width figures

> If you need a full-width figure, give it the fullwidth class. Make sure that’s inside an article, and it will take up (almost) the full width of the screen. This approach is demonstrated below using Edward Tufte’s English translation of the Napoleon’s March data visualization. From Beautiful Evidence, page 122-124.

HTML macro:

```
!rawinclude(pp-macros/html/tufte/fullwidthfigure.html.pp)
```

LaTeX macro:

```
!rawinclude(pp-macros/pdf/tufte/fullwidthfigure.pdf.pp)
```

Usage:

    !fullwidthfigure(This is a full-width figure caption)(./image/path/image.jpg)

# Use pp to preprocess Markdown

We can use a list of macros defined below to generate a HTML or LaTeX file depend on the format.

```
!rawinclude(pp-macros/tufte.pp)
```

# Use Pandoc to convert Markdown to HTML and PDF

I use build tasks in Visual Studio Code：

```
!rawinclude(.vscode/tasks.json)
```

# Acknowledgements

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)


[Pandoc]: http://pandoc.org
[pp]: https://github.com/CDSoft/pp
[Tufte CSS]: https://edwardtufte.github.io/tufte-css/
[Tufte LaTeX]: https://tufte-latex.github.io/tufte-latex/
[MiKTeX]: https://miktex.org/
[TeX Live]: https://www.tug.org/texlive/
[wkhtmltopdf]: https://wkhtmltopdf.org
