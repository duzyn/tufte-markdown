!comment(
// Table
// Usage: !table(CSV_FILENAME)(CAPTION)
)

!define(table)(
!ifeq(!format)(html)(
<div style="width: 55%">
<span class="marginnote">!2</span>

!csv(!1)
</div>
)

!ifeq(!format)(pdf)(
!csv(!1)
:   !2
)
)