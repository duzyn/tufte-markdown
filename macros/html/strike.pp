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