!comment(
// Side note
// Usage: !sidenote(TEXT)
)

!define(SN)(1)
!define(sidenote)(
!ifeq(!format)(html)(
<label for="sidenote-!SN" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-!SN" class="margin-toggle"/>
<span class="sidenote">!1</span>
!add(SN)(1)
)

!ifeq(!format)(pdf)(
\sidenote{!1}
)
)