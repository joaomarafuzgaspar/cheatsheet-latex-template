.PHONY: compile all clean

all: compile

compile: src/example.tex
	cd src ; latexmk -pdf -pdflatex="pdflatex" -use-make example.tex

example: src/example.tex
	cd src ; latexmk -pdf -pdflatex="pdflatex" -use-make example.tex

template: src/template.tex
	cd src ; latexmk -pdf -pdflatex="pdflatex" -use-make template.tex

clean:
	cd src ; latexmk -CA