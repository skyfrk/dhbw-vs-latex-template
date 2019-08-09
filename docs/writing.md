# Writing <!-- omit in toc -->

Documentation and general tips and tricks on how to wirte an academic text assignment for the [DBHW-VS](https://www.dhbw-vs.de/).

- [Sectioning](#sectioning)
  - [Sections](#sections)
  - [Subsections](#subsections)
- [Citing](#citing)
  - [Cite direct with footnote](#cite-direct-with-footnote)
  - [Cite indirect with footnote](#cite-indirect-with-footnote)
  - [Cite without footnote](#cite-without-footnote)
- [Acronyms](#acronyms)
- [Figures](#figures)
  - [Normal figure](#normal-figure)
  - [Wrap figures](#wrap-figures)
- [Tables](#tables)
- [Labels](#labels)
- [Bibliography](#bibliography)
- [Code listing](#code-listing)

## Sectioning

Sections and subsections are automatically numbered and added to the table of contents in order of appearance. Use `\section*{title}`, `\subsection*{title}` and `\subsubsection*{title}` to add unnumbered sections which don't appear in the table of contents.

>You can manually add unnumbered sections to the table of contents [using the \addcontentsline command](http://kb.mit.edu/confluence/pages/viewpage.action?pageId=3907522).

### Sections

Command: `\section{title}`

| Parameter | Description               |
| --------- | ------------------------- |
| `title`   | The title of the section. |

Adds a new numbered section to the text and the table of contents. Example below:

```tex
...this is the last sentence of the previous section.

\section{The title of the next section}

The first sentence in the next section...
```

### Subsections

Use `\subsection{title}` and `\subsubsection{title}` to create subsections below a section and subsubsections below a subsection. Example below:

```tex
...this is the last sentence of the previous section.

\section{The title of the next section}

The first sentence in the next section...

\subsection{The title of my subsection}

The first sentence in this subsections...

\subsubsection{The title of my subsubsection}

Nobody reads this anyway...
```

> Sections / Subsections should always have a least two childs!

## Citing

Every cite command will add the referenced bibliography entry to the [bibliography](#bibliography) at the end of the text.

### Cite direct with footnote

Command: `\mydirectfootcite{text}{bibEntryId}{page}`

| Parameter    | Description                                                       |
| ------------ | ----------------------------------------------------------------- |
| `text`       | The text you want to cite directly.                               |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography). |
| `page`       | The number of the page you are citing from. Can be empty.         |

Wraps given text in `„` and `"` and adds a footnote with given `bibEntryId` and `page`. Example below:

```tex
...so thats why a \mydirectfootcite{towel is the most
important item a Hitchhiker can carry}{hitchhiker78}{42}.
```

> This is just a wrapper using [\myfootcite](#cite-indirect) and `\enquote` from the CTAN package [csquotes](https://www.ctan.org/pkg/csquotes).

### Cite indirect with footnote

Command: `\myfootcite[prenote][page]{bibEntryId}`

| Parameter    | Description                                                                  |
| ------------ | ---------------------------------------------------------------------------- |
| `prenote`    | A prenote that will appear in front of the short reference (Usually `Vgl.`). |
| `page`       | The number of the page you are citing from. Can be empty.                    |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography).            |

Adds a footnote with given `bibEntryId`, `prenote` and `page`. Example below:

```tex
A Hitchhiker’s Guide To The Galaxy PDF by Adam Douglas
is a timeless science fiction masterpiece.\myfootcite[Vgl.][42]{hitchhiker78}
This is the next sentence...
```

### Cite without footnote

Command: `\mycite[prenote][page]{bibEntryId}`

| Parameter    | Description                                                                  |
| ------------ | ---------------------------------------------------------------------------- |
| `prenote`    | A prenote that will appear in front of the short reference (Usually `Vgl.`). |
| `page`       | The number of the page you are citing from. Can be empty.                    |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography).            |

Creates a short reference with given `bibEntryId`, `prenote` and `page` where the command is called. Example below:

```tex
Here is a short reference: \mycite[Vgl.][42]{hitchhiker78}
```

## Acronyms

TODO

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

## Figures

TODO

### Normal figure

TODO

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

### Wrap figures

TODO

```tex
\begin{wrapfigure}{r}{0.5\textwidth} % use wrapfigure instead of figure
    \centering
    \caption{Interesting caption}
    \includegraphics[scale=.6]{file-name}
    \caption*{\footnotesize{Source: Some website}}
    \label{fig:goodreference} % add a reference label
\end{wrapfigure}
```

## Tables

## Labels

TODO

```tex
As you can see in \autoref{fig:twosweetcats} there are cute cats in the world.
```

## Bibliography

TODO

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

## Code listing

TODO

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