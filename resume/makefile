all: clean doc move

clean:
	$(RM) resume.aux resume.log resume.out resume.pdf resume.bbl resume.blg


doc:
	pdflatex resume.tex
	bibtex resume
	pdflatex resume.tex
	pdflatex resume.tex

move:
	mv resume.pdf ../
