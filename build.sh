#!/bin/bash

FILE=$1
FILE_WITHOUT_EXT=${FILE%.*}

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
  latexmk -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -pdf -pdflatex=lualatex $FILE
  exit 0
fi

lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape $FILE
biber $FILE_WITHOUT_EXT
lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape $FILE
lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape $FILE

exit 0
