\ifeq(\format)(html)(
\define(latex)(
<span class="latex">L<span class="latex-sup">a</span>T<span class="latex-sub">e</span>X</span>
)
)
\ifeq(\format)(pdf)(
\define(latex)(
\raw(\LaTeX )
)
)
