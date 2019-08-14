#!/bin/bash

if ! [ -x "$(command -v pdflatex)" ]; then
  echo 'pdflatex is not installed. Aborting.' >&2
  exit 1
fi

if ! [ -x "$(command -v biber)" ]; then
  echo 'Biber is not installed. Aborting.' >&2
  exit 1
fi

if [ -x "$(command -v latexmk)" ]; then
  echo 'Using latexmk to compile.' >&2
  latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf root.tex
  exit 0
fi

pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
biber root
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex

exit 0
