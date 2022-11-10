!comment(
//  New thought
//  Usage: !newthought(TEXT)
)

!define(newthought)(
!ifeq(!format)(html)(
<span class="newthought">!1</span>
)

!ifeq(!format)(pdf)(
\newthought{!1}
)
)