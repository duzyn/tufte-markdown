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