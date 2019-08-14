if (-not (Get-Command biber -errorAction SilentlyContinue)){
    Write-Error 'biber is not installed. Aborting.' -ErrorAction Stop
}

if (-not (Get-Command pdflatex -errorAction SilentlyContinue)){
    Write-Error 'pdflatex is not installed. Aborting.' -ErrorAction Stop
}

if (Get-Command latexmk -errorAction SilentlyContinue)
{
    Write-Host 'Using latexmk'
    latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf root.tex
} else {
    pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
    biber root
    pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
    pdflatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
}
