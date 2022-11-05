!comment(
// LaTeX
// Usage: !latex
)

!define(latex)(
!ifeq(!format)(html)(
<span class="latex">L<span class="latex-sup">a</span>T<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\LaTeX
)
)

!comment(
// TeX
// Usage: !tex
)

!define(tex)(
!ifeq(!format)(html)(
<span class="latex">T<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\TeX
)
)

!comment(
// CTeX
// Usage: !ctex
)

!define(ctex)(
!ifeq(!format)(html)(
<span class="latex">CT<span class="latex-sub">e</span>X</span>
)

!ifeq(!format)(pdf)(
\CTeX
)
)
