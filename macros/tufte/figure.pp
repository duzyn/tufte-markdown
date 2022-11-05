!comment(
// Figure
// Usage: !figure(CAPTION)(FILENAME)
)

!define(F)(1)
!define(figure)(
!ifeq(!format)(html)(
<figure>
  <label for="figure-!F" class="margin-toggle">&#8853;</label>
  <input type="checkbox" id="figure-!F" class="margin-toggle"/>
  <span class="marginnote">!1</span>
  <img src="!2" alt="!1" />
</figure>
!add(F)(1)
)

!ifeq(!format)(pdf)(
\begin{figure}
  \includegraphics{!2}
  \caption{!1}
\end{figure}
)
)