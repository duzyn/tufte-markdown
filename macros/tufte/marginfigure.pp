!comment(
// Margin figure
// Usage: !marginfigure(CAPTION)(FILENAME)
)

!define(MF)(1)
!define(marginfigure)(
!ifeq(!format)(html)(
<label for="marginfigure-!MF" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginfigure-!MF" class="margin-toggle"/>
<span class="marginnote"><img src="!2" alt="!1"/>!1</span>
!add(MF)(1)
)

!ifeq(!format)(pdf)(
\begin{marginfigure}
  \includegraphics{!2}
  \caption{!1}
\end{marginfigure}
)
)