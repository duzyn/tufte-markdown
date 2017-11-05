!comment(
title:  Tufte Markdown
author: David Peng
date:   2017-06-30
)

!ifeq(!format)(html)
(
!import(html/common/a.html.pp)
!import(html/common/abbr.html.pp)
!import(html/common/em.html.pp)
!import(html/common/img.html.pp)
!import(html/common/kbd.html.pp)
!import(html/common/mark.html.pp)
!import(html/common/newpage.html.pp)
!import(html/common/strike.html.pp)
!import(html/common/strong.html.pp)
!import(html/common/textcenter.html.pp)
!import(html/common/textcolor.html.pp)
!import(html/common/textleft.html.pp)
!import(html/common/textright.html.pp)
!import(html/common/today.html.pp)
!import(html/common/u.html.pp)
)

!ifeq(!format)(pdf)
(
!import(pdf/common/a.pdf.pp)
!import(pdf/common/abbr.pdf.pp)
!import(pdf/common/em.pdf.pp)
!import(pdf/common/img.pdf.pp)
!import(pdf/common/kbd.pdf.pp)
!import(pdf/common/mark.pdf.pp)
!import(pdf/common/newpage.pdf.pp)
!import(pdf/common/strike.pdf.pp)
!import(pdf/common/strong.pdf.pp)
!import(pdf/common/textcenter.pdf.pp)
!import(pdf/common/textcolor.pdf.pp)
!import(pdf/common/textleft.pdf.pp)
!import(pdf/common/textright.pdf.pp)
!import(pdf/common/today.pdf.pp)
!import(pdf/common/u.pdf.pp)
)