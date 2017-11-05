!define(MARGINNOTE)(1)

!define(marginnote)
(
<label for="marginnote-!MARGINNOTE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="marginnote-!MARGINNOTE" class="margin-toggle"/>
<span class="marginnote">!1</span>
!add(MARGINNOTE)
)