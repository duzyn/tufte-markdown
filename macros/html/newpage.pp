!comment(
// newpage
// Usage: !newpage
)

!define(newpage)(
!ifeq(!format)(html)(
<div style="page-break-after: always"></div>
)

!ifeq(!format)(pdf)(
\newpage
)
)