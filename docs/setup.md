# Setup <!-- omit in toc -->

- [Install a LaTeX distribution](#install-a-latex-distribution)
- [Install a text editor](#install-a-text-editor)
- [Compiling to PDF](#compiling-to-pdf)

## Install a LaTeX distribution

Using [TeX Live](https://tug.org/texlive/) is recommended. You can also use [MiKTeX](https://miktex.org/download) though.

> If you're installing TeX Live downloading the [ISO](https://tug.org/texlive/acquire-iso.html) is faster than using the installer.

> You can skip installing LaTeX if you want to use a Visual Studio Code [development container](https://code.visualstudio.com/docs/remote/containers).

## Install a text editor

Recommended tooling:

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) (VS Code extension).
3. Install a [spelling checker](https://github.com/Jason-Rev/vscode-spell-checker) for your language (VS Code extension).
4. (Optional) Install [git](https://git-scm.com/).

> Some ideas on how to use [LaTeX with git](https://stackoverflow.com/a/6190412).

Alternatives:

* [Texmaker](http://www.xm1math.net/texmaker/)
* [TeXworks](http://www.tug.org/texworks/)

## Compiling to PDF

Run `build.sh` or `build.ps1` depending on your operating system. Both scripts try to use `latexmk` and else fall back to `pdflatex` and `biber`.

> `latexmk` [com­pletely au­to­mates](https://www.ctan.org/pkg/latexmk/) the pro­cess of gen­er­at­ing a LaTeX document.

If you're using VS Code as text editor you can take advantage of the already configured `.vscode/settings.json` which compiles using `latexmk` (part of TeX Live and MiKTeX) and if you don't want to use `latexmk` there is a another recipe using just `pdflatex` and `biber`.

> [Biber](https://github.com/plk/biber) is the backend processor for BibLaTeX (which replaces BibTeX). If Biber wasn't installed with your LaTeX distribution you have to install it [manually](https://sourceforge.net/projects/biblatex-biber/files/latest/download) in order to use this template.