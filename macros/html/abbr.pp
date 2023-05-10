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