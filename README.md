# Tufte Markdown

Tufte Markdown prodives tools to style web articles or paper handouts using the ideas demonstrated by Edward Tufte’s books and handouts. Tufte’s style is known for its simplicity, extensive use of sidenotes, tight integration of graphics with text, and carefully chosen typography.

You can simply write your articles with Markdown, then you can convert them to beautiful HTML and PDF articles using Tufte's style. Here is how-to.

## How to

I combined these tools to archive Tufte Markdown:

-   Markdown
-   [Pandoc]
-   [pp]: a powerful preprocessor with pandoc in mind
-   [Tufte CSS]
-   [Tufte LaTeX]
-   [MiKTeX] or [TeX Live] or [wkhtmltopdf]

You should download and install [Pandoc] and [pp] first. We get a HTML or PDF file with this process:

1.  Write a markdown article including pp macros.
2.  Use pp to preprocess the markdown and get a normal markdown file with HTML or LaTeX.
3.  Stream the markdown to Pandoc.
4.  Use a HTML template and Tufte CSS to get a HTML article.
5.  Use a LaTeX template and Tufte LaTeX to get a PDF article with a TeX document production system, like MiKTeX, Tex Live or ConTeXt. You can also generate a HTML file to PDF with wkhtmltopdf.

## pp Macros

1\. New thoughts

> In his later books _Beautiful Evidence_, Tufte starts each section with a bit of vertical space, a non-indented paragraph, and the first few words of the sentence set in small caps.

HTML macro:

    \define(newthought)(
    <span class="newthought">\1</span>
    )

LaTeX macro:

    \define(newthought)(
    \raw(\newthought){\1}
    )

Usage:

    \newthought(This is a new thought)

2\. Sidenotes

> One of the most distinctive features of Tufte’s style is his extensive use of sidenotes. Sidenotes are like footnotes, except they don’t force the reader to jump their eye to the bottom of the page, but instead display off to the side in the margin. Perhaps you have noticed their use in this document already. You are very astute.

HTML macro:

    \define(sidenote)(
    <label for="sidenote-\SIDENOTE" class="margin-toggle sidenote-number"></label>
    <input type="checkbox" id="sidenote-\SIDENOTE" class="margin-toggle"/>
    <span class="sidenote">\1</span>
    \add(SIDENOTE)
    )

LaTeX macro:

    \define(sidenote)(
    \raw(\sidenote){\1}
    )

Usage:

    \sidenote(This is a new sidenote)

3\. Margin notes

> If you want a sidenote without footnote-style numberings, then you want a margin note. On large screens, a margin note is just a sidenote that omits the reference number. This lessens the distracting effect taking away from the flow of the main text, but can increase the cognitive load of matching a margin note to its referent text.

HTML macro:

    \define(marginnote)(
    <label for="marginnote-\MARGINNOTE" class="margin-toggle">&#8853;</label>
    <input type="checkbox" id="marginnote-\MARGINNOTE" class="margin-toggle"/>
    <span class="marginnote">\1</span>
    \add(MARGINNOTE)
    )

LaTeX macro:

    \define(marginnote)(
    \raw(\marginnote){\1}
    )

Usage:

    \marginnote(This is a new margin note)

4\. Figures

> Tufte emphasizes tight integration of graphics with text. Data, graphs, and figures are kept with the text that discusses them. In print, this means they are not relegated to a separate page. On the web, that means readability of graphics and their accompanying text without extra clicks, tab-switching, or scrolling.

HTML macro:

    \define(figure)(
    <figure>
    <label for="figure-\FIGURE" class="margin-toggle">&#8853;</label>
    <input type="checkbox" id="figure-\FIGURE" class="margin-toggle"/>
    <span class="marginnote">\1</span>
    <img src="\2" alt="\1" />
    </figure>
    \add(FIGURE)
    )

LaTeX macro:

    \define(figure)(
    \raw(\begin{figure})
    \raw(\includegraphics){\2}
    \raw(\caption){\1}
    \raw(\end{figure})
    )

Usage:

    \figure(This is a figure caption)(./image/path/image.jpg)

5\. Margin figures

> But tight integration of graphics with text is central to Tufte’s work even when those graphics are ancillary to the main body of a text. In many of those cases, a margin figure may be most appropriate. To place figures in the margin, just wrap an image (or whatever) in a margin note inside a p tag, as seen to the right of this paragraph.

HTML macro:

    \define(marginfigure)(
    <label for="marginfigure-\MARGINFIGURE" class="margin-toggle">&#8853;</label>
    <input type="checkbox" id="marginfigure-\MARGINFIGURE" class="margin-toggle"/>
    <span class="marginnote"><img src="\2" alt="\2"/>\1</span>
    \add(MARGINFIGURE)
    )

LaTeX macro:

    \define(marginfigure)(
    \raw(\begin{marginfigure})
    \raw(\includegraphics){\2}
    \raw(\caption){\1}
    \raw(\end{marginfigure})
    )

Usage:

    \marginfigure(This is a margin figure caption)(./image/path/image.jpg)

6\. Full-width figures

> If you need a full-width figure, give it the fullwidth class. Make sure that’s inside an article, and it will take up (almost) the full width of the screen. This approach is demonstrated below using Edward Tufte’s English translation of the Napoleon’s March data visualization. From Beautiful Evidence, page 122-124.

HTML macro:

    \define(fullwidthfigure)(
    <figure class="fullwidth">
    <img src="\2" alt="\1">
    </figure>
    )

LaTeX macro:

    \define(fullwidthfigure)(
    \raw(\begin{figure*}
    \includegraphics){\2}
    \raw(\caption){\1}
    \raw(\end{figure*})
    )

Usage:

    \fullwidthfigure(This is a full-width figure caption)(./image/path/image.jpg)

# Use pp to preprocess Markdown

We can use a list of macros defined below to generate a HTML or \latex file depend on the format.

```
\comment(
title:  Tufte Markdown
author: David Peng
date:   2017-06-02
)

\define(SIDENOTE)(1)
\define(MARGINNOTE)(1)
\define(FIGURE)(1)
\define(MARGINFIGURE)(1)

\comment(
// 1. New Thoughts
// Usage:
// \newthought(This is a new thought)
)

\ifeq(\format)(html)(
\define(newthought)(
<span class="newthought">\1</span>
)
)
\ifeq(\format)(pdf)(
\define(newthought)(
\raw(\newthought){\1}
)
)

\comment(
// 2. Sidenotes
// Usage:
// \sidenote(This is a new sidenote)
)

\ifeq(\format)(html)(
\define(sidenote)(
<label for="sidenote-\SIDENOTE" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-\SIDENOTE" class="margin-toggle"/>
<span class="sidenote">\1</span>
\add(SIDENOTE)
)
)
\ifeq(\format)(pdf)(
\define(sidenote)(
\raw(\sidenote){\1}
)
)

\comment(
// 3. Margin notes
// Usage:
// \marginnote(This is a new margin note)
)

\ifeq(\format)(html)(
\define(marginnote)(
<label for="marginnote-\MARGINNOTE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-\MARGINNOTE" class="margin-toggle"/>
<span class="marginnote">\1</span>
\add(MARGINNOTE)
)
)
\ifeq(\format)(pdf)(
\define(marginnote)(
\raw(\marginnote){\1}
)
)

\comment(
// 4. Figures
// Usage:
// \figure(This is a figure caption)(./image/path/image.jpg)
)

\ifeq(\format)(html)(
\define(figure)(
<figure>
<label for="figure-\FIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="figure-\FIGURE" class="margin-toggle"/>
<span class="marginnote">\1</span>
<img src="\2" alt="\1" />
</figure>
\add(FIGURE)
)
)
\ifeq(\format)(pdf)(
\define(figure)(
\raw(\begin{figure})
\raw(\includegraphics){\2}
\raw(\caption){\1}
\raw(\end{figure})
)
)

\comment(
// 5. Margin figures
// Usage:
// \marginfigure(This is a margin figure caption)(./image/path/image.jpg)
)

\ifeq(\format)(html)(
\define(marginfigure)(
<label for="marginfigure-\MARGINFIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginfigure-\MARGINFIGURE" class="margin-toggle"/>
<span class="marginnote"><img src="\2" alt="\1"/>\1</span>
\add(MARGINFIGURE)
)
)
\ifeq(\format)(pdf)(
\define(marginfigure)(
\raw(\begin{marginfigure})
\raw(\includegraphics){\2}
\raw(\caption){\1}
\raw(\end{marginfigure})
)
)

\comment(
// 6. Full-width figures
// Usage:
// \fullwidthfigure(This is a full-width figure caption)(./image/path/image.jpg)
)
\ifeq(\format)(html)(
\define(fullwidthfigure)(
<figure class="fullwidth">
<img src="\2" alt="\1">
</figure>
)
)
\ifeq(\format)(pdf)(
\define(fullwidthfigure)(
\raw(\begin{figure*}
\includegraphics){\2}
\raw(\caption){\1}
\raw(\end{figure*})
)
)
```

# Use Pandoc to convert Markdown to HTML and PDF

Convert Markdown to HTML：

```
pp -html sample-handout.md | pandoc -o sample-handout.html -t html5 -s \
--template=./templates/tufte-handout.html -c tufte-css/latex.css -c tufte-css/tufte.css
```

Convert Markdown to PDF：

```
pp -pdf sample-handout.md | pandoc -o sample-handout.pdf -f markdown+raw_tex \
--latex-engine=xelatex --template=./templates/tufte-handout.tex -V documentclass:tufte-handout
```

# Acknowledgements

-   [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
-   [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
-   [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
-   [RStudio Pandoc template: tufte-handout.tex](https://raw.githubusercontent.com/rstudio/tufte/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)


[Pandoc]: http://pandoc.org
[pp]: https://github.com/CDSoft/pp
[Tufte CSS]: https://edwardtufte.github.io/tufte-css/
[Tufte LaTeX]: https://tufte-latex.github.io/tufte-latex/
[MiKTeX]: https://miktex.org/
[TeX Live]: https://www.tug.org/texlive/
[wkhtmltopdf]: https://wkhtmltopdf.org
