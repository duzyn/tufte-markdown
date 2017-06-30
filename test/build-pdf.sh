pp -pdf -import=../pp-macros/common.pp common.md | pandoc -o common.pdf \
-f markdown+raw_tex --template=default.latex --latex-engine=xelatex \
-V graphics:true -V strikeout:true \
-V header-includes:"\usepackage{soul}" -V header-includes:"\usepackage{color}" 