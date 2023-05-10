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