!comment(
// flushleft
// Usage: !flushleft(TEXT)
)

!define(flushleft)(
!ifeq(!format)(html)(
<div>
  <p style="text-align: left">!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{flushleft}
  !1
\end{flushleft}
)
)