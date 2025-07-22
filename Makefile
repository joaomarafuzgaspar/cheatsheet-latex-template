.PHONY: compile all clean

all: compile

compile: src/main.tex
	cd src ; latexmk -pdf -pdflatex="pdflatex" -use-make main.tex

example: src/example.tex
	cd src ; latexmk -pdf -pdflatex="pdflatex" -use-make example.tex

clean:
	cd src ; latexmk -CA