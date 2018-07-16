# DHBW-VS academic text LaTeX template

This is a LaTeX template for academic text assignments at the [DBHW-VS](https://www.dhbw-vs.de/), especially for Business Informatics students. Created along the specifications written by Mrs. Heinrich. It is intended to save time by using this template because you can focus on the content of the text instead of worrying about the formatting in WYSIWYG (**W**hat **y**ou **s**ee **i**s **w**hat **y**ou **g**et) text editors like [LibreOffice Writer](https://www.libreoffice.org/). Look at the example [here](https://github.com/Skyfr3ak/dhbw-vs-latex-template/blob/master/root.pdf).

## Usage

### Prerequisites

#### LaTeX

Obviously you have to install LaTeX itself. For example [TeX Live](https://tug.org/texlive/).

#### LaTeX editor

* Recommended: [Visual Studio](https://visualstudio.microsoft.com/) with the [Visual Studio Code LaTeX Workshop Extension](https://github.com/James-Yu/LaTeX-Workshop) and a [spelling checker](https://github.com/Jason-Rev/vscode-spell-checker).
* [Texmaker](http://www.xm1math.net/texmaker/)
* [MikTeX](https://miktex.org/)

#### Optional: git (works great with [Visual Studio](https://visualstudio.microsoft.com/))

[Git](https://git-scm.com/) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

[Reasons](https://stackoverflow.com/a/6190412) for using [git](https://git-scm.com/).

### Setup

1. Download this template. If you are using git you can use `git clone`.
2. Open `root.tex` with your editor of choice.
3. Customize `misc/properties.tex` to your needs.
4. Start writing in `pages/text.tex`. Easy as that!

### Project structure

* **assets/**
  * Files that are used for the design. E.g.: The logo of the DHBW.
  * assets/**company-logo.png**
    * Place the logo of your company as a picture here with this name.
* **figures/**
  * Figures used in the text.
* **misc/**
  * Files used for configuration and other purposes.
  * misc/**header.tex**
    * Loading packages and configuring basic properties of the document.
  * misc/**dhbw-bibstyle.tex**
    * Loads custom DHBW bibliography style. Imported in misc/**header.tex**
  * misc/**dhbw-citestyle.tex**
    * Loads custom DHBW citing style. Imported in misc/**header.tex**
  * misc/**literature.bib**
    * The bibliography. List all of your sources in here. Note: only the cited sources get printed to the document.
  * misc/**properties.tex**
    * Setup the properties of your scientific text. E.g.: Your name or your companies name.
  * misc/**specs.md**
    * All specifications from Mrs. Heinrich's script (2017 edition).
* **pages/**
  * All pages imported by **root.tex**.
  * pages/**acronym.tex**
    * List all of your acronyms here. Note: You have to sort them manually by the alphabet!
  * pages/**independence-notice.tex**
    * This is the independence notice which has to be included.
  * pages/**non-disclosure-notice.tex**
    * This is the non-disclosure notice which has to be included if your company wants you to do so, which is normally the case.
  * pages/**text.tex**
    * This is the file where your actual work goes into.
  * pages/**title.tex**
    * This is the title page. It gets it's data from the misc/**properties.tex** file.
  * pages/**utilities-used.tex**
    * In this file you have to list all the tools you used for your work.
* **root.pdf**
  * This is the final output file.
* **root.tex**
  * This is the main .tex file which glues all parts together.

### Examples

#### Create sections

```tex
\section{Living beings} % top level caption
\section*{Living beings} % top level caption, unnumbered
\subsection{Humans}
\subsubsection{Chuck Norris}
```

#### Cite direct

```tex
\glqq Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\grqq{}\myfootcite[42]{hitchhiker}

% '42' is the number of the page in the source you are citing from.
% 'hitchhiker' is the name of your source in your .bib literature file.
% '\glqq' and '\grqq{}' generate the german quotes.
```

#### Cite indirect

```tex
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\myfootcite[Vgl.][42]{hitchhiker}

% '42' is the number of the page in the source you are citing from. Can be blank.
% 'hitchhiker' is the name of your source in your .bib literature file.
% 'Vgl.' is the prefix of the short reference in the footnote.
```

#### Acronym

```tex
% in the file pages/acronym.tex
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
\includegraphics[width=\textwidth]{file-name} % put your pictures into ./figures/
\caption*{\footnotesize{Source: Some website}}
\label{fig:goodreference} % add a reference label
\end{figure}

% refer to a figure
Lorem ipsum dolor sit amet \autoref{goodreference} consetetur sadipscing elitr.
% will resolve to:
% Lorem ipsum dolor sit amet figure 1 consetetur sadipscing elitr.
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

Add your entries to `/misc/literature.bib`. You always have to provide a `shorttitle`. If `edition=1` delete the edition key.

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

## Contribute

Feel free to fork this repository and submit a pull request!

### Unresolved issues

* `\usepackage[parfill]{parskip}` throws a warning.
  * Ignore.
* `Underfull \hbox` or `Overfull \hbox` messages.
  * LaTeX can't find a way to properly print a long string. For example a long URL. You only have to take action if it looks ugly. Try to add `\sloppy` and see if it helps.

### Resources

* [BibLaTeX manual](https://www.ctan.org/pkg/biblatex)
* [tex.stackexchange.com](https://tex.stackexchange.com/) is a awesome community for questions about LaTeX.

## Credits

* [@moewe](https://tex.stackexchange.com/users/35864/moewe) contributed a lot to the bibliography style. Thank you!
* [@Audrey](https://tex.stackexchange.com/users/4483/audrey) provided a custom nymdt sorting style. Thank you!
* #MWIGA

## License

Licensed under the [MIT](https://opensource.org/licenses/mit-license.php) license.
