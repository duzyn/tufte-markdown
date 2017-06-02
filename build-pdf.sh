pp -pdf sample-handout.md | pandoc -o sample-handout.pdf -f markdown+raw_tex \
--latex-engine=xelatex.exe --template=./templates/tufte-handout.tex -V documentclass:tufte-handout
