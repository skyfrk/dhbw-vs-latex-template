#!/bin/bash

if ! [ -x "$(command -v lualatex)" ]; then
  echo 'lualatex is not installed. Aborting.' >&2
  exit 1
fi

if ! [ -x "$(command -v biber)" ]; then
  echo 'Biber is not installed. Aborting.' >&2
  exit 1
fi

if [ -x "$(command -v latexmk)" ]; then
  echo 'Using latexmk to compile.' >&2
  latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -pdflatex=lualatex root.tex
  exit 0
fi

lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
biber root
lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex

exit 0
