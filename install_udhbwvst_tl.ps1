$path = $(kpsewhich -var-value TEXMFHOME)

New-Item -ItemType Directory -Force -Path $path/tex/latex/udhbwvst

Copy-Item -Recurse -force ./src/udhbwvst* $path/tex/latex/udhbwvst

texhash $path