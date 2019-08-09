# Prerequisites <!-- omit in toc -->

- [Install a LaTeX distribution](#install-a-latex-distribution)
- [Make sure pdflatex and biber are in your path](#make-sure-pdflatex-and-biber-are-in-your-path)
- [Install a text editor](#install-a-text-editor)

## Install a LaTeX distribution

Using [TeX Live](https://tug.org/texlive/) is recommended. You can also use [MiKTeX](https://miktex.org/download) though.

> If you're installing TeX Live downloading the [ISO](https://tug.org/texlive/acquire-iso.html) is faster than using the installer.

> You can skip installing LaTeX if you want to use a Visual Studio Code [development container](https://code.visualstudio.com/docs/remote/containers).

## Make sure pdflatex and biber are in your path

Check if you can run `pdflatex` and `biber` in your command line environment. Add them to your path if they cannot be found.

> [Biber](https://github.com/plk/biber) is the backend processor for BibLaTeX (which replaces BibTeX). If Biber wasn't installed with your LaTeX distribution you have to install it [manually](https://sourceforge.net/projects/biblatex-biber/files/latest/download) in order to use this template.

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
