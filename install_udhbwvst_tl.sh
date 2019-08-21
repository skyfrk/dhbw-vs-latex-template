#!/bin/bash

path=$(kpsewhich -var-value TEXMFHOME)

mkdir -p $path/tex/latex/udhbwvst

cp -Rf ./src/* $path/tex/latex/udhbwvst

texhash $path