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

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Tufte style Markdown macros
)
!import(tufte/audio.pp)
!import(tufte/figure.pp)
!import(tufte/fullwidth.pp)
!import(tufte/fullwidthfigure.pp)
!import(tufte/fullwidthvideo.pp)
!import(tufte/latex.pp)
!import(tufte/marginfigure.pp)
!import(tufte/marginnote.pp)
!import(tufte/newthought.pp)
!import(tufte/sidenote.pp)
!import(tufte/table.pp)
!import(tufte/video.pp)

!comment(
// HTML tags macros
)
!import(html/a.pp)
!import(html/abbr.pp)
!import(html/center.pp)
!import(html/em.pp)
!import(html/flushleft.pp)
!import(html/flushright.pp)
!import(html/img.pp)
!import(html/kbd.pp)
!import(html/mark.pp)
!import(html/newpage.pp)
!import(html/strike.pp)
!import(html/strong.pp)
!import(html/textcolor.pp)
!import(html/today.pp)
!import(html/u.pp)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Audio (Only for HTML)
// Usage: !audio(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
// Use html5media: https://github.com/etianen/html5media
// <script src="https://cdn.jsdelivr.net/npm/html5media@1.2.1/dist/api/1.2.1/html5media.min.js"></script>
)

!define(A)(1)
!define(audio)(
!ifeq(!format)(html)(
<div>
  <label for="audio-!A" class="margin-toggle">&#8853;</label>
  <input type="checkbox" id="audio-!A" class="margin-toggle"/>
  <span class="marginnote">!1</span>
  <audio controls>
    <source src="!2">
    !ifdef(3)(<source src="!3">)
    !ifdef(4)(<source src="!4">)
    !ifdef(5)(<source src="!5">)
  </audio>
</div>
!add(A)(1)
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Figure
// Usage: !figure(CAPTION)(FILENAME)
)

!define(F)(1)
!define(figure)(
!ifeq(!format)(html)(
<figure>
  <label for="figure-!F" class="margin-toggle">&#8853;</label>
  <input type="checkbox" id="figure-!F" class="margin-toggle"/>
  <span class="marginnote">!1</span>
  <img src="!2" alt="!1" />
</figure>
!add(F)(1)
)

!ifeq(!format)(pdf)(
\begin{figure}
  \includegraphics{!2}
  \caption{!1}
\end{figure}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Fullwidth block
// Usage: !fullwidth(TEXT)
)

!define(fullwidth)(
!ifeq(!format)(html)(
<div class="fullwidth">
  <p>!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{fullwidth}
  !1
\end{fullwidth}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Fullwidth figure
// Usage: !fullwidthfigure(CAPTION)(FILENAME)
)

!define(fullwidthfigure)(
!ifeq(!format)(html)(
<figure class="fullwidth">
  <img src="!2" alt="!1"/>
</figure>
<span class="marginnote">!1</span>
)

!ifeq(!format)(pdf)(
\begin{figure*}
  \includegraphics{!2}
  \caption{!1}
\end{figure*}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Fullwidth Video (Only for HTML)
// Usage: !fullwidthvideo(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
)

!define(fullwidthvideo)(
!ifeq(!format)(html)(
<div>
  <video controls class="fullwidth">
    <source src="!2">
    !ifdef(3)(<source src="!3">)
    !ifdef(4)(<source src="!4">)
    !ifdef(5)(<source src="!5">)
  </video>
</div>
<span class="marginnote">!1</span>
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// LaTeX
// Usage: !latex
)

!define(latex)(
!ifeq(!format)(html)(
<span class="latex">L<span class="latex-sup">a</span>T<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\LaTeX
)
)

!comment(
// TeX
// Usage: !tex
)

!define(tex)(
!ifeq(!format)(html)(
<span class="latex">T<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\TeX
)
)

!comment(
// CTeX
// Usage: !ctex
)

!define(ctex)(
!ifeq(!format)(html)(
<span class="latex">CT<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\CTeX
)
)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Margin figure
// Usage: !marginfigure(CAPTION)(FILENAME)
)

!define(MF)(1)
!define(marginfigure)(
!ifeq(!format)(html)(
<label for="marginfigure-!MF" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginfigure-!MF" class="margin-toggle"/>
<span class="marginnote"><img src="!2" alt="!1"/>!1</span>
!add(MF)(1)
)

!ifeq(!format)(pdf)(
\begin{marginfigure}
  \includegraphics{!2}
  \caption{!1}
\end{marginfigure}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Margin note
// Usage: !marginnote(TEXT)
)

!define(MN)(1)
!define(marginnote)(
!ifeq(!format)(html)(
<label for="marginnote-!MN" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-!MN" class="margin-toggle"/>
<span class="marginnote">!1</span>
!add(MN)(1)
)

!ifeq(!format)(pdf)(
\marginnote{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
//  New thought
//  Usage: !newthought(TEXT)
)

!define(newthought)(
!ifeq(!format)(html)(
<span class="newthought">!1</span>
)

!ifeq(!format)(pdf)(
\newthought{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Side note
// Usage: !sidenote(TEXT)
)

!define(SN)(1)
!define(sidenote)(
!ifeq(!format)(html)(
<label for="sidenote-!SN" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-!SN" class="margin-toggle"/>
<span class="sidenote">!1</span>
!add(SN)(1)
)

!ifeq(!format)(pdf)(
\sidenote{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Table
// Usage: !table(CSV_FILENAME)(CAPTION)
)

!define(table)(
!ifeq(!format)(html)(
<div style="width: 55%">
<span class="marginnote">!2</span>

!csv(!1)
</div>
)

!ifeq(!format)(pdf)(
!csv(!1)
:   !2
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// Video (Only for HTML)
// Usage: !video(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
// Use html5media: https://github.com/etianen/html5media
// <script src="https://cdn.jsdelivr.net/npm/html5media@1.2.1/dist/api/1.2.1/html5media.min.js"></script>
)

!define(V)(1)
!define(video)(
!ifeq(!format)(html)(
<div>
  <label for="video-!V" class="margin-toggle">&#8853;</label>
  <input type="checkbox" id="video-!V" class="margin-toggle"/>
  <span class="marginnote">!1</span>
  <video controls>
    <source src="!2">
    !ifdef(3)(<source src="!3">)
    !ifdef(4)(<source src="!4">)
    !ifdef(5)(<source src="!5">)
  </video>
</div>
!add(V)(1)
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// a
// Usage: !a(TEXT)(URL)
)

!define(a)(
!ifeq(!format)(html)(
<a href="!2">!1</a>
)

!ifeq(!format)(pdf)(
\href{!2}{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// abbr
// Usage: !abbr(TITLE)(TEXT)
)

!define(abbr)(
!ifeq(!format)(html)(
<abbr title="!1">!2</abbr>
)

!ifeq(!format)(pdf)(
!2\footnote{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// center
// Usage: !center(TEXT)
)

!define(center)(
!ifeq(!format)(html)(
<div style="margin: 0 auto">
  <p style="text-align: center">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{center}
  !1
\end{center}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// em
// Usage: !em(TEXT)
)

!define(em)(
!ifeq(!format)(html)(
<em>!1</em>
)

!ifeq(!format)(pdf)(
\emph{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// flushleft
// Usage: !flushleft(TEXT)
)

!define(flushleft)(
!ifeq(!format)(html)(
<div>
  <p style="text-align: left">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{flushleft}
  !1
\end{flushleft}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// flushright
// Usage: !flushright(TEXT)
)

!define(flushright)(
!ifeq(!format)(html)(
<div>
  <p style="text-align: right">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{flushright}
  !1
\end{flushright}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// img
// Usage: !img(ALT_TEXT)(FILENAME)
)

!define(img)(
!ifeq(!format)(html)(
<img src="!2" alt="!1" />
)

!ifeq(!format)(pdf)(
\includegraphics{!2}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// kbd
// Usage: !kbd(KEY_1)(KEY_2)(KEY_3)(KEY_4)
)

!define(kbd)(
!ifeq(!format)(html)(
<kbd>!1</kbd>
!ifdef(2)(+ <kbd>!2</kbd>)
!ifdef(3)(+ <kbd>!3</kbd>)
!ifdef(4)(+ <kbd>!4</kbd>)
)

!ifeq(!format)(pdf)(
\texttt{!1}
!ifdef(2)(+ \texttt{!2})
!ifdef(3)(+ \texttt{!3})
!ifdef(4)(+ \texttt{!4})
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// mark
// Usage: !mark(TEXT)
)

!define(mark)(
!ifeq(!format)(html)(
<mark>!1</mark>
)

!comment(
// \usepackage{soul}
)
!ifeq(!format)(pdf)(
\hl{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// newpage
// Usage: !newpage
)

!define(newpage)(
!ifeq(!format)(html)(
<div style="page-break-after: always"></div>
)

!ifeq(!format)(pdf)(
\newpage
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// strike
// Usage: !strike(TEXT)
)

!define(strike)(
!ifeq(!format)(html)(
<strike>!1</strike>
)

!ifeq(!format)(pdf)(
\sout{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// strong
// Usage: !strong(TEXT)
)

!define(strong)(
!ifeq(!format)(html)(
<strong>!1</strong>
)

!ifeq(!format)(pdf)(
\textbf{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// textcolor
// Usage: !textcolor(TEXT)
)

!define(textcolor)(
!ifeq(!format)(html)(
<span style="color:!1">!2</span>
)

!comment(
// \usepackage{color}
)
!ifeq(!format)(pdf)(
\textcolor{!1}{!2}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// today
// Usage: !today
)

!define(today)(
!ifeq(!format)(html)(
!ifeq(!os)(windows)(
!powershell(Get-Date -Format yyyy-MM-dd)
)

!ifeq(!os)(darwin)(
!sh(date "+%Y-%m-%d")
)

!ifeq(!os)(linux)(
!sh(date "+%Y-%m-%d")
)
)

!ifeq(!format)(pdf)(
\today
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!comment(
// u
// Usage: !u(TEXT)
)

!define(u)(
!ifeq(!format)(html)(
<u>!1</u>
)

!ifeq(!format)(pdf)(
\underline{!1}
)
)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


See example [justfile](./.justfile).

## Read more

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- [Tufte-LaTeX](https://tufte-latex.github.io/tufte-latex/)
- [RStudio Tufte Handout](https://rstudio.github.io/tufte/)
- [R Markdown Tufte Style](https://rstudio.github.io/tufte/cn/)
- [RStudio Pandoc template: tufte-handout.tex](https://github.com/rstudio/tufte/blob/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex)
