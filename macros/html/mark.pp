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