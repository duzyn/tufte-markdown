!comment(
// kbd
// Usage: !kbd(KEY_1)(KEY_2)(KEY_3)(KEY_4)
)

!define(kbd)(
!ifeq(!format)(html)(
<kbd>!1</kbd>
!ifdef(2)(+ <kbd>!2</kbd>)
!ifdef(3)(+ <kbd>!3</kbd>)
!ifdef(4)(+ <kbd>!4</kbd>)
)

!ifeq(!format)(pdf)(
\texttt{!1}
!ifdef(2)(+ \texttt{!2})
!ifdef(3)(+ \texttt{!3})
!ifdef(4)(+ \texttt{!4})
)
)