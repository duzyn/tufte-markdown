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
)

!ifeq(!format)(pdf)
(
!import(pdf/tufte/newthought.pdf.pp)
!import(pdf/tufte/sidenote.pdf.pp)
!import(pdf/tufte/marginnote.pdf.pp)
!import(pdf/tufte/figure.pdf.pp)
!import(pdf/tufte/marginfigure.pdf.pp)
!import(pdf/tufte/fullwidthfigure.pdf.pp)
)