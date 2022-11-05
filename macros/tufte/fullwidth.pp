!comment(
// Fullwidth block
// Usage: !fullwidth(TEXT)
)

!define(fullwidth)(
!ifeq(!format)(html)(
<div class="fullwidth">
  <p>!1</p>
</div>
)

!ifeq(!format)(pdf)(
\begin{fullwidth}
  !1
\end{fullwidth}
)
)