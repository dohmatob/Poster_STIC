all: clean
	pdflatex Poster_STIC.tex
	bibtex Poster_STIC
	pdflatex Poster_STIC.tex
	pdflatex Poster_STIC.tex


clean:
	rm -f *.log *.aux *.brf *.blg *.bbl *.brf *.out *.dvi *.nav *.snm *.toc
