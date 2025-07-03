all: clean compile

clean:
	cd resume/
	rm *.log *.aux *.out *.bbl *.bcf *.blg resume.pdf

compile:
	cd resume/
	pdflatex resume.tex
	bibtex resume
	pdflatex resume.tex
	pdflatex resume.tex
	cp resume.pdf ../
