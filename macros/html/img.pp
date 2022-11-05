!comment(
// img
// Usage: !img(ALT_TEXT)(FILENAME)
)

!define(img)(
!ifeq(!format)(html)(
<img src="!2" alt="!1" />
)

!ifeq(!format)(pdf)(
\includegraphics{!2}
)
)