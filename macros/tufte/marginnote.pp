!comment(
// Margin note
// Usage: !marginnote(TEXT)
)

!define(MN)(1)
!define(marginnote)(
!ifeq(!format)(html)(
<label for="marginnote-!MN" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-!MN" class="margin-toggle"/>
<span class="marginnote">!1</span>
!add(MN)(1)
)

!ifeq(!format)(pdf)(
\marginnote{!1}
)
)