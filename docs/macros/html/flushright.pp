!comment(
// flushright
// Usage: !flushright(TEXT)
)

!define(flushright)(
!ifeq(!format)(html)(
<div>
  <p style="text-align: right">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{flushright}
  !1
\end{flushright}
)
)