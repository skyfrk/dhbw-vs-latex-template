#!/bin/bash

build () {
    cp -r ./src/* "$1"
    latexmk -cd -pdf -latexoption=-file-line-error -latexoption=-interaction=nonstopmode -pdflatex=lualatex -latexoption=-shell-escape "$1/$2"
}

build "./examples/full" "full.tex"
build "./examples/starter-advanced" "starter-advanced.tex"
build "./examples/starter-recommended" "starter-recommended.tex"
