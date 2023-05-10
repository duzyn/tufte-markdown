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