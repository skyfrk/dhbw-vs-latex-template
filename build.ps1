if (-not (Get-Command biber -errorAction SilentlyContinue)){
    Write-Error 'biber is not installed. Aborting.' -ErrorAction Stop
}

if (-not (Get-Command lualatex -errorAction SilentlyContinue)){
    Write-Error 'lualatex is not installed. Aborting.' -ErrorAction Stop
}

if (Get-Command latexmk -errorAction SilentlyContinue)
{
    Write-Host 'Using latexmk'
    latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -pdflatex=lualatex root.tex
} else {
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
    biber root
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error root.tex
}
