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
