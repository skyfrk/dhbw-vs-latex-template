#!/bin/bash

# Update date in src/udhbwvst.cls
sed -i 's/\\newcommand\*{\\udhbwvst@cls@date}{.*}/\\newcommand\*{\\udhbwvst@cls@date}{'"$(printf '%(%Y-%m-%d)T\n' -1)"'}/g' src/udhbwvst.cls

# Update version in src/udhbwvst.cls
sed -i 's/\\newcommand\*{\\udhbwvst@cls@version}{.*}/\\newcommand\*{\\udhbwvst@cls@version}{'"$1"'}/g' src/udhbwvst.cls

# Create starter project
mkdir starter
cp -r .vscode starter
cp .gitignore starter
cp build.sh starter
cp build.ps1 starter
cp .devcontainer.json starter
cp examples/starter-recommended/starter-recommended.tex starter/text.tex
touch starter/literature.bib

# Create ZIP for GitHub Releases
zip -r udhbwvst-"$1".zip src starter install_udhbwvst_tl.ps1 install_udhbwvst_tl.sh -x src/.gitignore