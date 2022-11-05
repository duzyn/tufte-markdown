!comment(
// Fullwidth figure
// Usage: !fullwidthfigure(CAPTION)(FILENAME)
)

!define(fullwidthfigure)(
!ifeq(!format)(html)(
<figure class="fullwidth">
  <img src="!2" alt="!1"/>
</figure>
<span class="marginnote">!1</span>
)

!ifeq(!format)(pdf)(
\begin{figure*}
  \includegraphics{!2}
  \caption{!1}
\end{figure*}
)
)