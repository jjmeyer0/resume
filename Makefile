all: pdf html html_move markdown clean

pdf:
	pdflatex resume.tex

html:
	htlatex resume.tex

html_move:
	mv resume.html docs/index.html
	mv resume.css docs/

markdown:
	pandoc -f latex -t gfm -o README.md resume.tex

markdown_remove_span:
	sed -Ee 's/<[\/]?span>//g' README.md > README.tmp && mv README.tmp README.md

markdown_remove_extra_chars:
	sed -e 's/|:--|:--|//g' README.md > README.tmp && mv README.tmp README.md

markdown_remove_more_chars:
	sed -e 's/||//' README.md > README.tmp && mv README.tmp README.md

markdown_remove_even_more:
	sed -e "s/|/ /" README.md > README.tmp && mv README.tmp README.md

markdown_cleanup: markdown_remove_span markdown_remove_extra_chars markdown_remove_more_chars markdown_remove_even_more

setupenv:
	sudo apt install texlive-latex-base texlive-plain-generic texlive-extra-utils pandoc texlive-latex-extra

clean:
	rm *~ res.log resume.aux resume.4ct resume.4tc resume.dvi resume.idv resume.lg resume.log resume.tmp resume.xref *.tmp *\#
