!define(SIDENOTE)(1)

!define(sidenote)
(
<label for="sidenote-!SIDENOTE" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="sidenote-!SIDENOTE" class="margin-toggle"/>
<span class="sidenote">!1</span>
!add(SIDENOTE)
)