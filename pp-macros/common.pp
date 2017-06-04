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
// \abbr(title)(text)
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
// \textcolor(color)(text)
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

\comment(
// 11. New page
// Usage:
// \newpage
)

\ifeq(\format)(html)(
\define(newpage)(
<div style="page-break-after: always"></div>
)
)
\ifeq(\format)(pdf)(
\define(newpage)(
\raw(\newpage)
)
)

\comment(
// 12. Today
// Usage:
// \today
)

\ifeq(\format)(html)(
\define(today)(
\bash(date +%Y-%m-%d)
)
)
\ifeq(\format)(pdf)(
\define(today)(
\raw(\today)
)
)

\comment(
// 13. Keyboard
// Usage:
// \today
)

\ifeq(\format)(html)(
\define(kbd)(
<kbd>\1</kbd>\ifdef(2)(+<kbd>\2</kbd>)\ifdef(3)(+<kbd>\3</kbd>)\ifdef(4)(+<kbd>\4</kbd>)
)
)
\ifeq(\format)(pdf)(
\define(kbd)(
\raw(\texttt){\1}\ifdef(2)(+\raw(\texttt){\2})\ifdef(3)(+\raw(\texttt){\3})\ifdef(4)(+\raw(\texttt){\4})
)
)

\comment(
// 14. Strike out
// Usage:
// \strike(Text)
)

\ifeq(\format)(html)(
\define(strike)(
<strike>\1</strike>
)
)
\ifeq(\format)(pdf)(
\define(strike)(
\raw(\sout){\1}
)
)

\comment(
// 15. Mark
// Usage:
// \mark(Text)
)

\ifeq(\format)(html)(
\define(mark)(
<mark>\1</mark>
)
)
\ifeq(\format)(pdf)(
\define(mark)(

)
)
