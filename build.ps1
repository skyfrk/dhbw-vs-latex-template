Param(
  [parameter(mandatory=$true)][string]$file
)

if (-not (Get-Command biber -errorAction SilentlyContinue)){
    Write-Error 'biber is not installed. Aborting.' -ErrorAction Stop
}

if (-not (Get-Command lualatex -errorAction SilentlyContinue)){
    Write-Error 'lualatex is not installed. Aborting.' -ErrorAction Stop
}

if (Get-Command latexmk -errorAction SilentlyContinue)
{
    Write-Host 'Using latexmk'
    latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -pdflatex=lualatex $file
} else {
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error $file
    biber (Get-Item $file ).Basename
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error $file
    lualatex -synctex=1 -interaction=nonstopmode -file-line-error $file
}
