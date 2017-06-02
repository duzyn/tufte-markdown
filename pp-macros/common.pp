\comment(Some common macros replacing Markdown default)

\comment(
// 1. Image
// Usage:
// \img(This is a alt text)(./path/to/image.jpg)
)

\ifeq(\format)(html)(
\define(img)(
<img src="\2" alt="\1" />
)
)
\ifeq(\format)(pdf)(
\define(img)(
\raw(\includegraphics){\2}
)
)

\comment(
// 2. Strong
// Usage:
// \strong(This is a bold face text)
)

\ifeq(\format)(html)(
\define(strong)(
<strong>\1</strong>
)
)
\ifeq(\format)(pdf)(
\define(strong)(
\raw(\textbf){\1}
)
)

\comment(
// 3. Emphasis
// Usage:
// \em(This is a Emphasis text)
)

\ifeq(\format)(html)(
\define(em)(
<em>\1</em>
)
)
\ifeq(\format)(pdf)(
\define(em)(
\raw(\emph){\1}
)
)

\comment(
// 4. Underline
// Usage:
// \u(Text)
)

\ifeq(\format)(html)(
\define(u)(
<u>\1</u>
)
)
\ifeq(\format)(pdf)(
\define(u)(
\raw(\underline){\1}
)
)

\comment(
// 5. Abbr.
// Usage:
// \abbr(Text)
)

\ifeq(\format)(html)(
\define(abbr)(
<abbr title="\1">\2</abbr>
)
)
\ifeq(\format)(pdf)(
\define(abbr)(
\2\raw(\footnote){\1}
)
)

\comment(
// 6. Colored text
// Usage:
// \textcolor(Text)
// Need to install xecolor package.
)

\ifeq(\format)(html)(
\define(textcolor)(
<span style="color:\1">\2</span>
)
)
\ifeq(\format)(pdf)(
\define(textcolor)(
\raw(\textxecolor){\1}{\2}
)
)

\comment(
// 7. Left-aligned text
// Usage:
// \textleft(Text)
)

\ifeq(\format)(html)(
\define(textleft)(
<div style="text-align: left">\1</div>
)
)
\ifeq(\format)(pdf)(
\define(textleft)(
\raw(\begin{flushleft})
\1
\raw(\end{flushleft})
)
)

\comment(
// 8. Right-aligned text
// Usage:
// \textright(Text)
)

\ifeq(\format)(html)(
\define(textright)(
<div style="text-align: right">\1</div>
)
)
\ifeq(\format)(pdf)(
\define(textright)(
\raw(\begin{flushright})
\1
\raw(\end{flushright})
)
)

\comment(
// 9. Centered text
// Usage:
// \textcenter(Text)
)

\ifeq(\format)(html)(
\define(textcenter)(
<div style="text-align: center">\1</div>
)
)
\ifeq(\format)(pdf)(
\define(textcenter)(
\raw(\begin{center})
\1
\raw(\end{center})
)
)

\comment(
// 10. Links
// Usage:
// \a(Text)(href)
)

\ifeq(\format)(html)(
\define(a)(
<a href="\2">\1</a>
)
)
\ifeq(\format)(pdf)(
\define(a)(
\raw(\href){\2}{\1}
)
)
