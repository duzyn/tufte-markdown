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