!comment(
// TUFTE STYLE
)

!comment(
// New thought
// Usage: !newthought(TEXT)
)

!define(newthought)(
!ifeq(!format)(html)(
<span class="newthought">!1</span>
)

!ifeq(!format)(pdf)(
\newthought{!1}
)
)


!comment(
// Side note
// Usage: !sidenote(TEXT)
)

!define(SIDENOTE)(1)
!define(sidenote)(
!ifeq(!format)(html)(
<label for="sidenote-!SIDENOTE" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-!SIDENOTE" class="margin-toggle"/>
<span class="sidenote">!1</span>
!add(SIDENOTE)
)

!ifeq(!format)(pdf)(
\sidenote{!1}
)
)


!comment(
// Margin note
// Usage: !marginnote(TEXT)
)

!define(MARGINNOTE)(1)
!define(marginnote)(
!ifeq(!format)(html)(
<label for="marginnote-!MARGINNOTE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-!MARGINNOTE" class="margin-toggle"/>
<span class="marginnote">!1</span>
!add(MARGINNOTE)
)

!ifeq(!format)(pdf)(
\marginnote{!1}
)
)


!comment(
// Figure
// Usage: !figure(CAPTION)(FILENAME)
)

!define(FIGURE)(1)
!define(figure)(
!ifeq(!format)(html)(
<figure>
<label for="figure-!FIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="figure-!FIGURE" class="margin-toggle"/>
<span class="marginnote">!1</span>
<img src="!2" alt="!1" />
</figure>
!add(FIGURE)
)

!ifeq(!format)(pdf)(
\begin{figure}
\includegraphics{!2}
\caption{!1}
\end{figure}
)
)


!comment(
// Margin figure
// Usage: !marginfigure(CAPTION)(FILENAME)
)

!define(MARGINFIGURE)(1)
!define(marginfigure)(
!ifeq(!format)(html)(
<label for="marginfigure-!MARGINFIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginfigure-!MARGINFIGURE" class="margin-toggle"/>
<span class="marginnote"><img src="!2" alt="!1"/>!1</span>
!add(MARGINFIGURE)
)

!ifeq(!format)(pdf)(
\begin{marginfigure}
\includegraphics{!2}
\caption{!1}
\end{marginfigure}
)
)


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


!comment(
// Fullwidth block
// Usage: !fullwidth(TEXT)
)

!define(fullwidth)(
!ifeq(!format)(html)(
<div class="fullwidth"><p>!1</p></div>
)

!ifeq(!format)(pdf)(
\begin{fullwidth}
!1
\end{fullwidth}
)
)


!comment(
// Video (Only for HTML)
// Usage: !video(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
// Use html5media: https://github.com/etianen/html5media
// <script src="https://cdn.jsdelivr.net/npm/html5media@1.2.1/dist/api/1.2.1/html5media.min.js"></script>
)

!define(VIDEO)(1)
!define(video)(
!ifeq(!format)(html)(
<div>
    <label for="video-!VIDEO" class="margin-toggle">&#8853;</label>
    <input type="checkbox" id="video-!VIDEO" class="margin-toggle"/>
    <span class="marginnote">!1</span>
    <video controls>
        <source src="!2">
        !ifdef(3)(<source src="!3">)
        !ifdef(4)(<source src="!4">)
        !ifdef(5)(<source src="!5">)
    </video>
</div>
!add(VIDEO)
)
)


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


!comment(
// Audio (Only for HTML)
// Usage: !audio(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
// Use html5media: https://github.com/etianen/html5media
// <script src="https://cdn.jsdelivr.net/npm/html5media@1.2.1/dist/api/1.2.1/html5media.min.js"></script>
)

!define(AUDIO)(1)
!define(audio)(
!ifeq(!format)(html)(
<div>
    <label for="audio-!AUDIO" class="margin-toggle">&#8853;</label>
    <input type="checkbox" id="audio-!AUDIO" class="margin-toggle"/>
    <span class="marginnote">!1</span>
    <audio controls>
        <source src="!2">
        !ifdef(3)(<source src="!3">)
        !ifdef(4)(<source src="!4">)
        !ifdef(5)(<source src="!5">)
    </audio>
</div>
!add(AUDIO)
)
)

!comment(
// Table
// Usage: !table(CSV_FILENAME)(CAPTION)
)

!define(table)(
!ifeq(!format)(html)(
<span class="marginnote">!2</span>

!csv(!1)
)

!ifeq(!format)(pdf)(
!csv(!1)
:   !2
)
)


!comment(
// Fullwidth table
// Usage: !fullwidthtable(CSV_FILENAME)(CAPTION)
)

!define(fullwidthtable)(
!ifeq(!format)(html)(
<div class="fullwidth">!csv(!1)</div>
<span class="marginnote">!2</span>
)

!ifeq(!format)(pdf)(
`\begin{fullwidth}`{=latex}

!csv(!1)
:   !2

`\end{fullwidth}`{=latex}
)
)


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
// HTML TAGS
)


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


!comment(
// kbd
// Usage: !kbd(KEY_1)(KEY_2)(KEY_3)(KEY_4)
)

!define(kbd)(
!ifeq(!format)(html)(
<kbd>!1</kbd>!ifdef(2)(+<kbd>!2</kbd>)!ifdef(3)(+<kbd>!3</kbd>)!ifdef(4)(+<kbd>!4</kbd>)
)

!ifeq(!format)(pdf)(
\texttt{!1}!ifdef(2)(+\texttt{!2})!ifdef(3)(+\texttt{!3})!ifdef(4)(+\texttt{!4})
)
)


!comment(
// mark
// Usage: !mark(TEXT)
)

!define(mark)(
!ifeq(!format)(html)(
<mark>!1</mark>
)

!comment(// \usepackage{soul})
!ifeq(!format)(pdf)(
\hl{!1}
)
)


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


!comment(
// center
// Usage: !center(TEXT)
)

!define(center)(
!ifeq(!format)(html)(
<div style="margin: 0 auto"><p style="text-align: center">!1</p></div>
)

!ifeq(!format)(pdf)(
\begin{center}
!1
\end{center}
)
)


!comment(
// flushleft
// Usage: !flushleft(TEXT)
)

!define(flushleft)(
!ifeq(!format)(html)(
<div><p style="text-align: left">!1</p></div>
)

!ifeq(!format)(pdf)(
\begin{flushleft}
!1
\end{flushleft}
)
)


!comment(
// flushright
// Usage: !flushright(TEXT)
)

!define(flushright)(
!ifeq(!format)(html)(
<div><p style="text-align: right">!1</p></div>
)

!ifeq(!format)(pdf)(
\begin{flushright}
!1
\end{flushright}
)
)


!comment(
// textcolor
// Usage: !textcolor(TEXT)
)

!define(textcolor)(
!ifeq(!format)(html)(
<span style="color:!1">!2</span>
)

!comment(// \usepackage{color})
!ifeq(!format)(pdf)(
\textcolor{!1}{!2}
)
)


!comment(
// today
// Usage: !today
)

!define(today)(
!ifeq(!format)(html)(
!ifeq(!os)(windows)(
!cmd(
@ECHO OFF
:: Based on https://ss64.com/nt/syntax-getdate.html
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO Syntax

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
    IF NOT "%%~L"=="" (
        SET year=%%L
        SET month=00%%J
        SET day=00%%G
        SET hour=00%%H
        SET minute=00%%I
    )
)

:: Pad digits with leading zeros
SET month=%month:~-2%
SET day=%day:~-2%
SET hour=%hour:~-2%
SET minute=%minute:~-2%

:: Display the date/time in ISO 8601 format:
:: SET isoDate=%year%-%month%-%day% %hour%:%minute%
SET isoDate=%year%-%month%-%day%
ECHO %isoDate%

:: Done
GOTO:EOF

:Syntax
ECHO SortDate.bat, Version 5.01 for Windows XP Pro and later
ECHO Displays date and time in YYYY-MM-DD and HH:mm:SS format,
ECHO completely independent of Windows' Regional Settings or
ECHO language, and without the use of temporary files.
ECHO.
)
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
