!comment(
// center
// Usage: !center(TEXT)
)

!define(center)(
!ifeq(!format)(html)(
<div style="margin: 0 auto">
  <p style="text-align: center">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{center}
  !1
\end{center}
)
)