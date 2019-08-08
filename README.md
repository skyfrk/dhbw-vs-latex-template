# DHBW-VS academic text LaTeX template

This is a LaTeX template for academic text assignments at the [DBHW-VS](https://www.dhbw-vs.de/), especially for business computer science students created along [the specifications](template/dhbw-text-requirements.md) written by Mrs. Heinrich. Using this template helps to focus on writing actual content instead of worrying about formatting.

>If you're looking for a [Citavi](https://www.citavi.com/) template checkout [stabiloBOSS96/ZitationsstilDHBW-VS-WI](https://github.com/stabiloBOSS96/ZitationsstilDHBW-VS-WI).

Example academic text assignment using this template: [skyfrk/dhbw-vs-smart-home-report](https://github.com/skyfrk/dhbw-vs-smart-home-report)

## Usage

### Prerequisites

>You can skip installing LaTeX if you want to use a Visual Studio Code [development container](https://code.visualstudio.com/docs/remote/containers).

#### Install a LaTeX distribution

Using [MiKTeX](https://miktex.org/download) is recommended because it is more lightweight. You can also use [TeX Live](https://tug.org/texlive/) though.

> If you're installing TeX Live downloading the [ISO](https://tug.org/texlive/acquire-iso.html) is faster than using the installer.

#### Make sure pdflatex and biber are in your path

Check if you can run `pdflatex` and `biber` in your command line environment. Add them to your path if they cannot be found.

> [Biber](https://github.com/plk/biber) is the backend processor for BibLaTeX (which replaces BibTeX). If Biber wasn't installed with your LaTeX distribution you have to install it [manually](https://sourceforge.net/projects/biblatex-biber/files/latest/download) in order to use this template.

#### Install a LaTeX editor

Recommended: Visual Studio Code with extensions

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install the [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) Visual Studio Code extension.
3. Install a [spelling checker](https://github.com/Jason-Rev/vscode-spell-checker) Visual Studio Code extension.
4. (Optional) Install [git](https://git-scm.com/).

> Some ideas on how to use [LaTeX with git](https://stackoverflow.com/a/6190412).

Alternatives:

* [Texmaker](http://www.xm1math.net/texmaker/)
* [TeXworks](http://www.tug.org/texworks/)

### Initial setup

1. Make sure your system meets all [prerequisites](#Prerequisites).
2. Download the [latest release](https://github.com/skyfrk/dhbw-vs-latex-template/releases) of this template.
3. Customize `content/misc/config.tex` to your needs.

### Documentation

#### Project structure

```text
.
├── .devcontainer                   | Contains the Visual Studio Code development container definition
├── .vscode                         | Visual Studio Code settings
├── LICENSE                         | License
├── README.md                       | Documentation
├── content                         | Content folder
│   ├── assets                      | Folder for binary assets like images
│   │   └── title                   | Folder for binary assets for the title page
│   │       ├── company-logo.png    | Logo of your company
│   │       └── dhbw-vs-logo.png    | DHBW-VS logo
│   ├── misc                        | Misc folder
│   │   ├── acronyms.tex            | List of acronyms
│   │   ├── config.tex              | Project configuration
│   │   └── literature.bib          | Bibliography file
│   └── text.tex                    | Actual text
├── root.pdf                        | Output PDF file
├── root.tex                        | Root file which ties everything together
└── template                        | Folder for template-related files
    ├── dhbw-bibstyle.tex           | DHBW-VS bibliography style
    ├── dhbw-citestyle.tex          | DHBW-VS cite style
    ├── dhbw-text-requirements.md   | DHBW-VS requirements for academic texts
    ├── header.tex                  | Load packages and basic configuration
    ├── independence-notice.tex     | DHBW-VS independence notice
    ├── non-disclosure-notice.tex   | DHBW-VS non-disclosure notice
    └── title.tex                   | Title page
```

#### Create sections

```tex
\section{Living beings} % top level caption
\section*{Living beings} % top level caption, unnumbered
\subsection{Humans}
\subsubsection{Chuck Norris}
```

#### Cite direct

```tex
\enquote{Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.}\myfootcite[42]{hitchhiker}

% '42' is the number of the page in the source you are citing from.
% 'hitchhiker' is the name of your source in your .bib literature file.
% '\enquote{}' is from the 'csquotes' package.
```

#### Cite indirect

```tex
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\myfootcite[Vgl.][42]{hitchhiker}

% '42' is the number of the page in the source you are citing from. Can be blank.
% 'hitchhiker' is the name of your source in your .bib literature file.
% 'Vgl.' is the prefix of the short reference in the footnote.
```

#### Acronyms

```tex
% in the file content/misc/acronym.tex
\acro{NiP}{Ninjas in Pyjamas}

% in the text
Lorem ipsum dolor sit amet, \ac{NiP} consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

% If the acronym was used for the first time \ac{} will genrate:
% [...] sit amet, Ninjas in Pyjamas (NiP) consetetur sadipscing [...]
% If the acronym was not used for the first time \ac{} will genrate:
% [...] sit amet, NiP consetetur sadipscing [...]
```

#### Figure

```tex
% include image
\begin{figure}[ht] % ht means that the figure should appear at this exact position
    \centering
    \caption{Interesting caption}
    \includegraphics[width=\textwidth]{file-name} % put your pictures into content/assets
    \caption*{\footnotesize{Source: Some website}}
    \label{fig:goodreference} % add a reference label
\end{figure}

% refer to a figure
Lorem ipsum dolor sit amet \autoref{fig:goodreference} consetetur sadipscing elitr.
% will resolve to:
% Lorem ipsum dolor sit amet figure 1 consetetur sadipscing elitr.
```

#### Reference to a figure or a section

```tex
As you can see in \autoref{fig:twosweetcats} there are cute cats in the world.
```

#### Let text wrap around a figure

```tex
\begin{wrapfigure}{r}{0.5\textwidth} % use wrapfigure instead of figure
    \centering
    \caption{Interesting caption}
    \includegraphics[scale=.6]{file-name}
    \caption*{\footnotesize{Source: Some website}}
    \label{fig:goodreference} % add a reference label
\end{wrapfigure}
```

#### Add a source to the bibliography

Entries in `/content/misc/literature.bib` should always have a `shorttitle`.

>If want to add the first edition of a source do **not** add an edition key to the entry.

```tex
@book{key,
    author = {Firstname Lastname and Otherfirstname Otherlastname},
    title = {Title},
    shorttitle = {Shorttitle},
    year = {1996},
    edition = {2},
    publisher = {Some company},
    location = {Berlin}
}

@online{anotherkey,
    author = {Lastname, Firstname},
    title = {Title},
    shorttitle = {Shorttitle},
    date = {2016-06-20},
    url = {https://somedomain.com},
    urldate = {2015-10-21}
}
```

#### Add a code listing

Have a look at the [docs](https://ctan.org/pkg/listings) for a detailed guide how to use the `listings`-package. The custom `subcaptionenv` macro automatically adds a subcaption to the listing.

> In addition to the natively supported languages this template defines styles for `csharp` and `javascript`.

```tex
\begin{subcaptionenv}{Source: \mycite[Vgl.][2]{example}}
    \begin{lstlisting}[caption={Express Example}, language=javascript]
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
        \end{lstlisting}
\end{subcaptionenv}
```

## Contribute

Feel free to open an [issue](https://github.com/skyfrk/dhbw-vs-latex-template/issues) or submit a pull request if you discovered a bug or want to submit a feature request! If you have questions about LaTeX in general have a look at the [resources section](#Resources).

### Resources

* General documentation: [CTAN (The Comprehensive TeX Archive Network)](https://www.ctan.org/)
* BibLaTeX documentation: [BibLaTeX manual](https://www.ctan.org/pkg/biblatex)
* Q&A community: [tex.stackexchange.com](https://tex.stackexchange.com/)

## Credits

* [moewe](https://tex.stackexchange.com/users/35864/moewe) for the bibliography style.
* [Audrey](https://tex.stackexchange.com/users/4483/audrey) for the custom nymdt sorting style.
* [robingenz](https://github.com/robingenz) for general improvements.
* [MrcoSchrnr](https://github.com/MrcoSchrnr) for useful hints.

## License

Licensed under the [MIT](https://opensource.org/licenses/mit-license.php) license.
