\comment(
// Todo list in Markdown
// Usage:
// \todolist(To-do list title)()
// \todo( |x)(Item to do)
)

\ifeq(\format)(html)(
\define(todolist)(
<p class="task-list-title">\1</p>
<ul class="task-list">
\2
</ul>
)
)
\ifeq(\format)(pdf)(
\define(todolist)(
\1
\raw(\newline)
\raw(\begin{tabular}{lll})
\2
\raw(\end{tabular})
)
)

\ifeq(\format)(html)(
\define(todo)(
<li class="task-list-item"><input type="checkbox" disabled=""\ifeq(\1)(x)( checked="")>\2</li>
)
)
\ifeq(\format)(pdf)(
\define(todo)(
\ifeq(\1)(x)
(\raw(\raisebox{-.25\height}{\includegraphics[scale=0.25]{checked.png}}) & \2 \raw(\\))
(\raw(\raisebox{-.25\height}{\includegraphics[scale=0.25]{unchecked.png}}) & \2 \raw(\\))
)
)
