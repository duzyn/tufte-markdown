!comment(
// strong
// Usage: !strong(TEXT)
)

!define(strong)(
!ifeq(!format)(html)(
<strong>!1</strong>
)

!ifeq(!format)(pdf)(
\textbf{!1}
)
)