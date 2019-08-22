# Setup <!-- omit in toc -->

- [Prerequisites](#prerequisites)
  - [Install a LaTeX distribution](#install-a-latex-distribution)
    - [Optional: Install PlantUML](#optional-install-plantuml)
  - [Install a text editor](#install-a-text-editor)
- [Installation](#installation)
  - [Recommended installation](#recommended-installation)
    - [TeXLive](#texlive)
    - [MiKTeX](#miktex)
  - [Quick and dirty installation](#quick-and-dirty-installation)
  - [Optional setup](#optional-setup)
- [Compiling to PDF](#compiling-to-pdf)

## Prerequisites

### Install a LaTeX distribution

This template was only tested using [TeX Live](https://tug.org/texlive/). You should however be able to use [MiKTeX](https://miktex.org/download) as well.

#### Optional: Install PlantUML

If you want to render [PlantUML](http://plantuml.com/)-diagrams embedded in your LaTeX code you have to install `PlantUML` and `Graphviz` and setup the environment variables `PLANTUML_JAR` and `GRAPHVIZ_DOT` according to the [setup instructions](https://github.com/koppor/plantuml#preconditions) of the `plantuml` LuaLaTeX package.

### Install a text editor

Recommended tooling:

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) (VS Code extension).
3. Install a [spelling checker](https://github.com/Jason-Rev/vscode-spell-checker) for your language (VS Code extension).
4. (Optional) Install [git](https://git-scm.com/).

> Some ideas on how to use [LaTeX with git](https://stackoverflow.com/a/6190412).

## Installation

### Recommended installation

It is recommended to install the template as a proper LaTeX class which has the advantage that the template files aren't polluting your working directory.

#### TeXLive

Run the `install_udhbwvst_tl.*` script supported by your operating system. The script copies the files inside the `src` folder to the correct position and runs `texhash`.

You can also do this manually:

1. Get the location of the `texmf` folder: `kpsewhich -var-value TEXMFHOME`
2. Create the folder structure `tex/latex/udhbwvst` inside the texmf folder.
3. Copy all files inside the `src` folder to `$texmf/tex/latex/udhbwvst`.
4. Run `texhash` on the `texmf` folder.

> [Further details](https://tex.stackexchange.com/a/73017/142408) on installing LaTeX classes and packages.

#### MiKTeX

Untested. Click [here](https://tex.stackexchange.com/a/69484/142408) for detailed instructions.

### Quick and dirty installation

Copy all files inside the `src` folder to your working directory. As long as your root `.tex` file and the class are in the same directory LaTeX will recognize the `udhbwvst` class.

> This way you can track the version of the template in the same source control as your text.

### Optional setup

* If you're using VS Code you can take advantage of the already configured `.vscode/settings.json` which compiles using `latexmk` (part of TeX Live and MiKTeX) and if you don't want to use `latexmk` there is a another recipe using just `lualatex` and `biber`.
* If you're using VS Code you can take advantage of many predefined snippets (`.vscode/udhbwvst.code-snippets`).
* If you are using [git](https://git-scm.com/) you can use the provided `.gitignore` file.

## Compiling to PDF

Run `./build.sh yourmain.tex` or `build.ps1 -file yourmain.tex` depending on your operating system. The build scripts try to use `latexmk` and fall back to `lualatex` and `biber` if `latexmk` is not available.

> `latexmk` [com­pletely au­to­mates](https://www.ctan.org/pkg/latexmk/) the pro­cess of gen­er­at­ing a LaTeX document.
