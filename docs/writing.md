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
  - [Add a new acronym](#add-a-new-acronym)
    - [Define a custom plural](#define-a-custom-plural)
  - [Using acronyms in text](#using-acronyms-in-text)
- [Figures](#figures)
  - [Normal figure](#normal-figure)
  - [Wrap figures](#wrap-figures)
- [Tables](#tables)
- [Labels and referencing](#labels-and-referencing)
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

This template uses the `acronym` CTAN package. Have a look at it's [documentation](https://ctan.org/pkg/acronym) for details on advanced usage.

### Add a new acronym

Before you can use an acronym in your text you have to add it inside the `acronym` environment in `content/misc/acronyms.tex`. The `acronym` environment takes one argument which will dictate how much space between the acronym and the long version of the acronym there will be. The `acronym` environment will just count the length of given parameter. According to the DHBW-VS you should always use the longest acronym twice here. Example below:

```tex
\begin{acronym}[NiPNiP]

\acro{C9}{Cloud 9}
\acro{NiP}{Ninjas in Pyjamas}
\acro{VP}{Virtus Pro}

\end{acronym}
```

:warning: You must manually sort the acronyms by alphabet. As of august 2019 the `acronym` package doesn't support automatic sorting.

#### Define a custom plural

Command: `\acroplural{acronym}[shortPlural]{longPlural}`

The `acronym` package adds an `s` to the short and long version of an acronym if no custom plural is defined. There are many cases when adding an `s` doesn't work. See the german example below:

```tex
\begin{acronym}[NiPNiP]

\acro{GF}{Globale Firma}
\acroplural{GF}[GF]{Globale Firmen}

\end{acronym}
```

### Using acronyms in text

Commands: `\ac{acronym}` (singular) and `\acp{acronym}` (plural)

The `acronym` package will make sure that first time an acronym is used it will be defined with the long version inline!

The `\acp{acronym}` command will add an `s` to the acronym if no [custom plural](#define-a-custom-plural) was defined.

```tex
\ac{NiP} was the first professional esports team to launch our own gaming peripheral
company, Xtrfy. \ac{NiP} is also active in the space of education within the esports
industry through several initiatives. In addition to this, \ac{NiP} is also an active
shareholder in the clothing company DRKN.
```

The example above will translate to:

```text
NiP (Ninjas in Pyjamas) was the first professional esports team to launch our
own gaming peripheral company, Xtrfy. NiP is also active in the space of
education within the esports industry through several initiatives. In addition
to this, NiP is also an active shareholder in the clothing company DRKN.
```

:warning: You always have wrap your acronyms in one of the commands above in order for the `acronym` package to work correctly.

## Figures

All figures will be automatically numbered and added to the list of figures.

### Normal figure

Adding a figure requires a few commands explained below the example:

```tex
\begin{figure}[h]
    \centering
    \caption{Quality Meme}
    \includegraphics[width=\textwidth]{surprised_pikachu.png}
    \caption*{\footnotesize{Source: \mycite{pikachu_website}}}
    \label{fig:pikachu}
\end{figure}
```

The `figure` environment takes a [placement specifier](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures) as argument. You're most likely to use `h` which LaTeX interprets as `place the figure here`.

The `\centering` command centers everything inside the `figure` environment.

The `\caption{caption}` command defines the title of the figure which will be placed above the figure and also be used in the list of figures.

The `\includegraphics[options]{pathToFigure}` command from the [graphicx](https://ctan.org/pkg/graphicx) CTAN package actually imports the figure to the pdf. You can specify many `options` like `width` or `scale` as key-value-pairs separated by a `,`. Have a look at [the documentation of the graphicx package](https://ctan.org/pkg/graphicx) for advanced options.

:warning: When `pathToFigure` is a relative path have in mind that the base directory for including graphics is `content/assets/`.

The `\caption*{\footnotesize{short reference}}` command combination adds a text below the figure to be used as short reference for the source of the figure.

The `\label{fig:marker}` command tags the figure with a marker. So that you can later refer to the image. Make sure to always write `fig:` in front of your marker so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique.

### Wrap figures

When you have a small graphic you can use the `wrapfigure` environment from the [wrapfig](https://ctan.org/pkg/wrapfig) CTAN package instead of the `figure` environment to let your text wrap around the graphic.

In the example below the `wrapfigure` environment takes two arguments. The first argument specifies the postion (normally `r` or `l` for right and left) and the second argument specifies the width of the graphic. Have a look at the [documentation of the wrapfig package](https://ctan.org/pkg/wrapfig) for details on advanced usage.

```tex
\begin{wrapfigure}{r}{0.5\textwidth}
    \centering
    \caption{Quality Meme}
    \includegraphics[width=\textwidth]{surprised_pikachu.png}
    \caption*{\footnotesize{Source: \mycite{pikachu_website}}}
    \label{fig:pikachu}
\end{wrapfigure}
```

## Tables

Adding a table requires a few commands explained below the example:

```tex
\begin{table}[h]
    \caption{Evil plan}
    \centering
    \begin{tabular}{ | c | l |}
        \hline
        \textbf{Phase}  & \textbf{Action}       \\ \hline
        1               & Use a latex template  \\ \hline
        2               & ???                   \\ \hline
        3               & Profit!               \\ \hline
    \end{tabular}
    \caption*{\footnotesize{Source: Own imagination}}
    \label{tab:evil_plan}
\end{table}
```

The `table` environment takes a [placement specifier](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures) as argument. You're most likely to use `h` which LaTeX interprets as `place the table here`.

The `\centering` command centers everything inside the `table` environment.

The `\caption{caption}` command defines the title of the table which will be placed above the table and also be used in the list of tables.

Inside the `tabular` environment the actual table is created. [Click here](https://en.wikibooks.org/wiki/LaTeX/Tables#The_tabular_environment) for a detailed guide on how to use the `tabular` environment.

The `\caption*{\footnotesize{short reference}}` command combination adds a text below the table to be used as short reference for the source of the data in the table.

The `\label{tab:marker}` command tags the table with a marker. So that you can later refer to the image. Make sure to always write `tab:` in front of your marker so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique.

## Labels and referencing

TODO

https://en.wikibooks.org/wiki/LaTeX/Labels_and_Cross-referencing

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