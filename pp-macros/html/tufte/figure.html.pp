!define(FIGURE)(1)

!define(figure)
(
<figure>
<label for="figure-!FIGURE" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="figure-!FIGURE" class="margin-toggle"/>
<span class="marginnote">!1</span>
<img src="!2" alt="!1" />
</figure>
!add(FIGURE)
)