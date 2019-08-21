# Writing <!-- omit in toc -->

Documentation and general tips and tricks on how to wirte an academic text assignment for the [DBHW-VS](https://www.dhbw-vs.de/).

- [The udhbwvst class](#the-udhbwvst-class)
  - [Class options](#class-options)
  - [Required \dhbwSetup command](#required-dhbwsetup-command)
  - [Document structure \dhbw* commands](#document-structure-dhbw-commands)
- [Sectioning](#sectioning)
  - [Sections](#sections)
  - [Subsections](#subsections)
- [Citing](#citing)
  - [Cite with footnote](#cite-with-footnote)
    - [Cite direct with footnote](#cite-direct-with-footnote)
    - [Cite indirect with footnote](#cite-indirect-with-footnote)
  - [Cite without footnote](#cite-without-footnote)
    - [Cite indirect without footnote](#cite-indirect-without-footnote)
- [Acronyms](#acronyms)
  - [Define a new acronym](#define-a-new-acronym)
    - [Define a custom plural](#define-a-custom-plural)
  - [Using acronyms in text](#using-acronyms-in-text)
- [Figures](#figures)
  - [The dhbwfigure environment](#the-dhbwfigure-environment)
  - [The \dhbwFigure command](#the-dhbwfigure-command)
  - [The \dhbwWrapfigure command](#the-dhbwwrapfigure-command)
  - [PlantUML figures](#plantuml-figures)
- [Tables](#tables)
- [Code listing](#code-listing)
- [Labels and referencing](#labels-and-referencing)
- [Bibliography](#bibliography)
  - [Add entry of type book](#add-entry-of-type-book)
  - [Add entry of type online](#add-entry-of-type-online)
  - [Author field format](#author-field-format)
    - [Firstname lastname combinations](#firstname-lastname-combinations)
    - [Author is just one word](#author-is-just-one-word)
    - [More than one author](#more-than-one-author)

## The udhbwvst class

The name of the class stands for ***Unofficial DHBW Villingen-Schwenningen*** LaTeX ***template***. Despite what the name suggests this class isn't a template anymore but a solid LaTeX class which can be build upon.

### Class options

| Option          | Default          | Description                                                            |
| --------------- | ---------------- | ---------------------------------------------------------------------- |
| `auto-generate` | `true`           | Generates all required pages around the text.                          |
| `debug`         | `false`          | Loads packages `lipsum` and `blindtext` and displays `hyperref`-links. |
| `print-ndn`     | `true`           | Prints the non-disclosure notice.                                      |
| `print-loa`     | `true`           | Prints the list of acronyms.                                           |
| `print-lof`     | `true`           | Prints the list of figures.                                            |
| `print-lot`     | `true`           | Prints the list of tables.                                             |
| `print-lol`     | `true`           | Prints the list of code listings.                                      |
| `bib-file`      | `literature.bib` | Path to the bibliography file.                                         |
| `plantuml`      | `false`          | Loads the `plantuml` package.                                          |

### Required \dhbwSetup command

In order to use the template you have to run the `\dhbwSetup{...}` command in your preamble. All parameters without a default value are **required**. You can access any key inside your document with the `\dhbwGet*` commands.

| Parameter         | Stored in                | Default                | Description                                                          | Example                 |
| ----------------- | ------------------------ | ---------------------- | -------------------------------------------------------------------- | ----------------------- |
| `author`          | `\dhbwGetAuthor`         | -                      | Full name of the author.                                             | Max Mustermann          |
| `faculty`         | `\dhbwGetFaculty`        | -                      | Faculty of the author.                                               | Wirtschaft              |
| `field of study`  | `\dhbwGetFieldOfStudy`   | -                      | Field of study of the author.                                        | Wirtschaftsinformatik   |
| `academic year`   | `\dhbwGetAcademicYear`   | -                      | Academic year of the author.                                         | 2017                    |
| `course`          | `\dhbwGetCourse`         | -                      | Course of the author.                                                | B                       |
| `title`           | `\dhbwGetTitle`          | -                      | Title of the text.                                                   | Eine Arbeit             |
| `subtitle`        | `\dhbwGetSubtitle`       | -                      | Subtitle of the text                                                 | Mit einem Untertitel    |
| `text type`       | `\dhbwGetTextType`       | -                      | Type of the text.                                                    | Projektarbeit 2         |
| `company name`    | `\dhbwGetCompanyName`    | -                      | Name of the authors employer.                                        | Eine GmbH               |
| `company logo`    | `\dhbwGetCompanyLogo`    | -                      | Path to the logo of the authors employer.                            | `./assets/logo.png`     |
| `lecturer`        | `\dhbwGetLecturer`       | -                      | Name of the lecturer of the author.                                  | Prof. Dr. Martin Kimmig |
| `location`        | `\dhbwGetLocation`       | Villingen-Schwenningen | Name of the location where the author signs the independence notice. | Villingen-Schwenningen  |
| `date`            | `\dhbwGetDate`           | `\today`               | When the author signs the independence notice.                       | `\today`                |
| `longest acronym` | `\dhbwGetLongestAcronym` | xD                     | The longest acronym in short form (Required for formatting).         | `DevOps`                |
| `acronyms`        | `\dhbwGetAcronyms`       | `{}`                   | The definition of the acronyms used in the text.                     | See [here](#acronyms)   |

### Document structure \dhbw* commands

If you set the [class option](#class-options) `auto-generate` to `false` you can use following commands to build a custom document:

| Command                         | Description                                                                                          |
| ------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `\dhbwSetFrontMatter`           | Sets up formatting for front pages.                                                                  |
| `\dhbwPrintTitle`               | Prints the title page.                                                                               |
| `\dhbwPrintNonDisclosureNotice` | Prints the non-disclosure notice if the [class option](#class-options) `print-ndn` is set to `true`. |
| `\dhbwPrintTableOfContents`     | Prints the table of content.                                                                         |
| `\dhbwSetListMatter`            | Sets up formatting for the list pages.                                                               |
| `\dhbwPrintListOfAcronyms`      | Prints the list of acronyms if the [class option](#class-options) `print-loa` is set to `true`.      |
| `\dhbwPrintListOfFigures`       | Prints the list of figures if the [class option](#class-options) `print-lof` is set to `true`.       |
| `\dhbwPrintListOfTables`        | Prints the list of tables if the [class option](#class-options) `print-lot` is set to `true`.        |
| `\dhbwPrintListOfListings`      | Prints the list of code listings if the [class option](#class-options) `print-lol` is set to `true`. |
| `\dhbwSetMainMatter`            | Sets up formatting for the main text pages.                                                          |
| `\dhbwPrintBibliography`        | Prints the bibliography.                                                                             |
| `\dhbwPrintIndependenceNotice`  | Prints the independence notice.                                                                      |
| `\dhbwPrintEverythingBefore`    | Prints all pages and sets up all formatting before the main text.                                    |
| `\dhbwPrintEverythingAfter`     | Prints the bibliography and the independence notice.                                                 |

## Sectioning

Sections and subsections are automatically numbered and added to the table of contents in order of appearance. Use `\section*{title}`, `\subsection*{title}` and `\subsubsection*{title}` to add unnumbered sections which don't appear in the table of contents.

> You can add a marker to a section using `\label{sec:marker}` to be able to [refer](#labels-and-referencing) to it later.

> You can manually add unnumbered sections to the table of contents [using the \addcontentsline command](http://kb.mit.edu/confluence/pages/viewpage.action?pageId=3907522).

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

### Cite with footnote

Command: `\footcite[prenote][page]{bibEntryId}`

| Parameter    | Description                                                                            |
| ------------ | -------------------------------------------------------------------------------------- |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography).                      |
| `prenote`    | A prenote that will appear in front of the short reference (Usually `Vgl.`). Optional. |
| `page`       | The number of the page you are citing from. Optional.                                  |

Adds a footnote with given `bibEntryId`, `prenote` and `page`. Example below:

```tex
A Hitchhiker’s Guide To The Galaxy PDF by Adam Douglas
is a timeless science fiction masterpiece.\footcite[Vgl.][42]{hitchhiker78}
This is the next sentence...
```

#### Cite direct with footnote

Command: `\dfootcite[page]{text}{bibEntryId}`

| Parameter    | Description                                                       |
| ------------ | ----------------------------------------------------------------- |
| `text`       | The text you want to cite directly.                               |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography). |
| `page`       | The number of the page you are citing from. Optional.             |

Wraps given text in `„` and `"` and adds a footnote with given `bibEntryId` and `page`. Example below:

```tex
...so thats why a \dfootcite[42]{hitchhiker78}{towel is the most
important item a Hitchhiker can carry}.
```

> This is just a wrapper using [\footcite](#cite-with-footnote) and `\enquote` from the CTAN package [csquotes](https://www.ctan.org/pkg/csquotes).

#### Cite indirect with footnote

Command: `\ifootcite[page]{bibEntryId}`

| Parameter    | Description                                                       |
| ------------ | ----------------------------------------------------------------- |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography). |
| `page`       | The number of the page you are citing from. Optional.             |

Adds a footnote with given `bibEntryId`, `page` and the prenote `Vgl.`. Example below:

```tex
A Hitchhiker’s Guide To The Galaxy PDF by Adam Douglas
is a timeless science fiction masterpiece.\ifootcite[42]{hitchhiker78}
This is the next sentence...
```

> This is just a wrapper using [\footcite](#cite-with-footnote).

### Cite without footnote

Command: `\cite[prenote][page]{bibEntryId}`

| Parameter    | Description                                                                            |
| ------------ | -------------------------------------------------------------------------------------- |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography).                      |
| `prenote`    | A prenote that will appear in front of the short reference (Usually `Vgl.`). Optional. |
| `page`       | The number of the page you are citing from. Can be empty. Optional.                    |

Creates a short reference with given `bibEntryId`, `prenote` and `page` where the command is called. Example below:

```tex
Here is a short reference: \cite[Vgl.][42]{hitchhiker78}
```

#### Cite indirect without footnote

Command: `\cite[page]{bibEntryId}`

| Parameter    | Description                                                         |
| ------------ | ------------------------------------------------------------------- |
| `bibEntryId` | The identifier of the entry in the [bibliography](#bibliography).   |
| `page`       | The number of the page you are citing from. Can be empty. Optional. |

Creates a short reference with given `bibEntryId`, `page` and prenote `Vgl.` where the command is called. Example below:

```tex
Here is a short reference: \icite[42]{hitchhiker78}
```

> This is just a wrapper using [\cite](#cite-without-footnote).

## Acronyms

This template uses the `acronym` CTAN package. Have a look at it's [documentation](https://ctan.org/pkg/acronym) for details on advanced usage.

### Define a new acronym

Before you can use an acronym in your text you have to define it inside the `acronyms` key of the [\dhbwSetup](#required-dhbwsetup-command) command. You also have to setup the `longest acronym` key. The `acronym` package will count the length of the given parameter and use it for the spacing between the short and the long version of an acronym. Example below:

```tex
\dhbwSetup{%
    ...
    longest acronym = NiP,
    acronyms        = {%
        \acro{C9}{Cloud 9}
        \acro{NiP}{Ninjas in Pyjamas}
        \acro{VP}{Virtus Pro}
    }
}
```

:warning: You must manually sort the acronyms by alphabet. As of august 2019 the `acronym` package doesn't support automatic sorting.

#### Define a custom plural

Command: `\acroplural{acronym}[shortPlural]{longPlural}`

The `acronym` package adds an `s` to the short and long version of an acronym if no custom plural is defined. There are many cases when adding an `s` doesn't work. See the german example below:

```tex
\dhbwSetup{%
    ...
    longest acronym = GF,
    acronyms        = {%
        \acro{GF}{Globale Firma}
        \acroplural{GF}[GF]{Globale Firmen}
    }
}
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

### The dhbwfigure environment

When adding a figure you should wrap it inside the `dhbwfigure` environment so that the DHBW formatting requirements are met automatically.

```tex
\begin{dhbwfigure}{caption=Pikachu,label=fig:pikachu,source={Internet People}}
    \includegraphics[width=\textwidth]{surprised_pikachu.png}
\end{dhbwfigure}
```

The `dhbwfigure` environment parameters `caption` and `label` are mandatory. See all possible parameters below:

| Parameter | Default            | Description                                                                                                                                                      |
| --------- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `caption` | -                  | Title of the figure.                                                                                                                                             |
| `label`   | -                  | Marker for `hyperref`. Make sure to start your marker with  `fig:` so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique. |
| `float`   | `ht`               | [Floating specifier](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures).                                                                  |
| `source`  | Eigene Darstellung | Source of the picture.                                                                                                                                           |

### The \dhbwFigure command

If you only want to quickly embed an image file you can use the `\dhbwFigure` command:

```tex
\dhbwFigure{caption=Pikachu,label=fig:pikachu,path=surprised_pikachu.png}
```

The parameters `caption`, `path` and `label` are required. See a full list of available parameters below:

| Parameter | Default            | Description                                                                                                                                                      |
| --------- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `caption` | -                  | Title of the figure.                                                                                                                                             |
| `path`    | -                  | Path to the image.                                                                                                                                               |
| `label`   | -                  | Marker for `hyperref`. Make sure to start your marker with  `fig:` so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique. |
| `source`  | Eigene Darstellung | Source of the picture.                                                                                                                                           |
| `width`   | `\textwidth`       | Width of the figure.                                                                                                                                             |
| `float`   | `ht`               | [Floating specifier](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions#Figures).                                                                  |

> `\dhbwFigure` is like the [dhbwfigure environment](#the-dhbwfigure-environment) with integrated `\includegraphics` command.

### The \dhbwWrapfigure command

If you want to embed a small graphic wrapped by your text you can use the `\dhbwWrapfigure` command which uses the `wrapfigure` environment from the [wrapfig](https://ctan.org/pkg/wrapfig) CTAN package.

```tex
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis condimentum
lacus quis nisi pulvinar, sed bibendum neque posuere. Nam ipsum nisl,
egestas at lectus vel, suscipit hendrerit mi. Sed dapibus fermentum mauris,
ut euismod leo vehicula ut. Mauris bibendum imperdiet nunc.

\dhbwWrapfigure{caption=Small Pikachu,label=fig:smallpikachu,path=small_pikachu.png}

Nullam accumsan, odio at ultrices vehicula, velit massa porta turpis, sed
auctor sem nisl in tortor. Nullam sollicitudin mollis arcu vitae sollicitudin.
Nunc rhoncus augue luctus erat maximus, sit amet commodo quam pellentesque.  
```

| Parameter     | Default            | Description                                                                                                                                                      |
| ------------- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `caption`     | -                  | Title of the figure.                                                                                                                                             |
| `label`       | -                  | Marker for `hyperref`. Make sure to start your marker with  `fig:` so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique. |
| `path`        | -                  | Path to the image.                                                                                                                                               |
| `source`      | Eigene Darstellung | Source of the picture.                                                                                                                                           |
| `placement`   | `R`                | [Placement specifier](http://mirrors.ctan.org/macros/latex/contrib/wrapfig/wrapfig-doc.pdf).                                                                     |
| `width`       | `0.45\textwidth`   | Width of the `wrapfigure` environment.                                                                                                                           |
| `image width` | `0.4\textwidth`    | Width of the picture.                                                                                                                                            |

> It is not possible to provide a `dhbwwrapfigure` environment because the `wrapfigure` environment doesn't work if wrapped in another environment.

### PlantUML figures

If you have [set up](./setup.md#optional-install-plantuml) PlantUML as described and also set the class option `plantuml` to `true` you can embed [PlantUML-diagrams](http://www.plantuml.com/) in your LaTeX code. Just surround you PlantUML notation with the `plantuml` environment:

```tex
\begin{dhbwfigure}{caption=Informative Sequence Diagram,label=fig:seq}
    \begin{plantuml}
        @startuml

        box "Machine"
            participant "Sensors" as sensors
            participant "OPC UA Server" as opc
        end box
        participant "Cloud" as cloud

        sensors <-> opc
        opc <-> cloud

        @enduml
    \end{plantuml}
\end{dhbwfigure}
```

:warning: As of version `0.2.3` of the `plantuml` LuaLaTeX package [UTF8 isn't supported](https://github.com/koppor/plantuml/issues/10). You can use any unicode character though (see [special characters](http://plantuml.com/creole)). For example `<U+00D6>` can be used to express `Ö`. Use a [unicode character table](https://unicode-table.com/en/) until UTF8 is supported.

## Tables

When adding a table you should wrap it inside the `dhbwtable` environment so that the DHBW formatting requirements are met automatically.

```tex
\begin{dhbwtable}{caption={Evilplan},label=tab:mytable,source={\icite{peterson16}},float=h}
    \begin{tabular}{ | c | l |}
        \hline
        \textbf{Phase}  & \textbf{Action}       \\ \hline
        1               & Use a latex template  \\ \hline
        2               & ???                   \\ \hline
        3               & Profit!               \\ \hline
    \end{tabular}
\end{dhbwtable}
```

| Parameter | Default              | Description                                                                                                                                                      |
| --------- | -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `caption` | -                    | Title above the table.                                                                                                                                           |
| `label`   | -                    | Marker for `hyperref`. Make sure to start your marker with  `tab:` so that [automatic referencing](#labels-and-referencing) works. This marker has to be unique. |
| `float`   | `ht`                 | [Floating specifier](https://en.wikibooks.org/wiki/LaTeX/Tables#Floating_with_table).                                                                            |
| `source`  | `Eigene Darstellung` | Source of the data in the table.                                                                                                                                 |

Inside the `tabular` environment the actual table is created. [Click here](https://en.wikibooks.org/wiki/LaTeX/Tables#The_tabular_environment) for a detailed guide on how to use the `tabular` environment.

## Code listing

You can add a code listing using the `code` environment:

```tex
\begin{code}{caption={Express Example},language=javascript,label=lst:express}{\icite[2]{example}}
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
\end{code}
```

The `code` environment is a custom `listings` environment. The first argument is used to pass options through to the `listings` environment and the second argument is the used for the short reference.

:warning: You should always pass the options listed below to the `listings` environment:

| Option     | Description                                                                                                                                                                                                |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `caption`  | The caption to appear above the code listing and in the list of code listings.                                                                                                                             |
| `language` | The language of the source code used for syntax highlighting. In addition to the languages [supported by default](https://ctan.org/pkg/listings) this template adds support for `csharp` and `javascript`. |
| `label`    | The marker used for [referencing](#labels-and-referencing). Has to begin with `lst:`.                                                                                                                      |

:warning: The short reference below the code listing is not inside the same float as the code. It can happen that the code listing and the reference have a page break between them. To prevent this you have to wrap the `code` environment with a `minipage` environment:

```tex
\begin{minipage}[c]{\textwidth}
\begin{code}{...}{...}
...
\end{code}
\end{minipage}
```

## Labels and referencing

When you want to refer to a section, figure, table or code listing you have to use a reference command like `\autoref{marker}` from the [hyperref](https://ctan.org/pkg/hyperref) CTAN package to do so because the number of a section for example is only determined at build time.

Using `\autoref{}` presupposes that you are using following tags in your labels so that it can produce the correct output:

| Tag     | Type         | Output (German; first appearance) |
| ------- | ------------ | --------------------------------- |
| sec:    | Section      | Abschnitt 1                       |
| subsec: | Subsection   | Unterabschnitt 1.1                |
| tab:    | Table        | Tabelle 1                         |
| fig:    | Figure       | Abbildung 1                       |
| lst:    | Code listing | Quellcode 1                       |

Take a look at the german example below:

```tex
\section{Dieser Abschnitt ist wahr}\label{sec:widerspruch_beispiel}
Dieser Abschnitt ist nicht wahr

\section{Anderer Abschnitt}\label{sec:andere}
Beim Lesen des \autoref{sec:widerspruch_beispiel} konnten Sie einen Widerspruch feststellen.
In \autoref{sec:andere} findet sich kein Widerspruch.
```

The text in the second section translates to:

```text
Beim Lesen des Abschnitt 1 konnten Sie einen Widerspruch feststellen.
In Abschnitt 2 findet sich kein Widerspruch.
```

[Click here](https://en.wikibooks.org/wiki/LaTeX/Labels_and_Cross-referencing) or read the [documenation of the hyperref package](https://ctan.org/pkg/hyperref) for details on advanced usage.

## Bibliography

When you're researching it is advised to store every source of information as an entry in your bibliography file. Biblatex will make sure to only print references you actually refered to in your bibliography at the end of the text. Biblatex will also sort entries by author, then by year, then by month, then by day and finally by title.

:warning: The DHBW-VS bibliography style was only tested with the entires of type [book](#add-entry-of-type-book) and [online](#add-entry-of-type-online). However [other types of entries](https://www.ctan.org/pkg/biblatex) should also work as long as they provide a `shorttitle` field!

### Add entry of type book

In order to satisfy the DHBW-VS requirements an bibliography entry of type `book` has to provide following fields:

| Field        | Description                                                                                                         |
| ------------ | ------------------------------------------------------------------------------------------------------------------- |
| `author`     | Author or authors of the book. See [author field format](#author-field-format).                                     |
| `title`      | Title of the book.                                                                                                  |
| `shorttitle` | Shorttitle for the reference.  Has to be unique.                                                                    |
| `year`       | Year of the publication of the book. :warning: Do not add a year field when the year is unknown.                    |
| `edition`    | The edition of the book. :warning: Do not add an edition field when you're refering to the first edition of a book. |
| `publisher`  | The publisher of the book.                                                                                          |
| `location`   | The city or place where to book was published.                                                                      |

Take a look at the [documentation of the biblatex package](https://www.ctan.org/pkg/biblatex) for optional entry fields. Example below:

```tex
@book{adams79,
    author      = {Douglas Adams},
    title       = {The Hitchhiker's Guide to the Galaxy},
    shorttitle  = {Hitchhiker},
    year        = {1979},
    publisher   = {Pan Books},
    location    = {Somecity}
}
```

### Add entry of type online

In order to satisfy the DHBW-VS requirements an bibliography entry of type `online` has to provide following fields:

| Field        | Description                                                                                                    |
| ------------ | -------------------------------------------------------------------------------------------------------------- |
| `author`     | Author or authors of the online entry. See [author field format](#author-field-format).                        |
| `title`      | The title of the online entry                                                                                  |
| `shorttitle` | The shorttitle of the online entry. Has to be unique.                                                          |
| `date`       | The date of the publication of the online entry. :warning: Do not add a `date` field when the date is unknown. |
| `url`        | The URL pointing to the online entry.                                                                          |
| `urldate`    | The date when the URL was visited the last time in `yyyy-mm-dd` format.                                        |

Valid example:

```tex
@online{hackthewood_first_article,
    author      = {Christian Neumann},
    title       = {HACK THE WOOD 2019},
    shorttitle  = {Hackathon},
    date        = {2019-03-14},
    urldate     = {2019-08-08},
    url         = {https://www.tapio.one/de/blog/hack-the-wood-2019}
}
```

### Author field format

There are many ways to use the `author` field. The most common ways are shown below. For advanced usage of the `author` field take a look at the [documentation of the biblatex package](https://www.ctan.org/pkg/biblatex).

#### Firstname lastname combinations

Both examples listed below are valid:

```tex
@online{tesla,
    author = {Elon Musk},
    ...
}
```

```tex
@online{tesla,
    author = {Musk, Elon},
    ...
}
```

#### Author is just one word

When the Author ist just one word for example the name of a company you have to define the `author` field this way:

```tex
@online{hackthewood,
    author = "{tapio}",
    ...
}
```

#### More than one author

You can add more than one author to an author field. Use the `and` keyword to seperate the names of the authors.

```tex
@online{programming,
    author = {Martin Fowler and Hanselman, Scott},
    ...
}
```

> You can use different [firstname-lastname-combinations](#firstname-lastname-combinations) in the same `author` field.

You can use the keyword `and others` if there are to many authors:

```tex
@online{paypalmafia,
    author = {Jawed Karin and Stoppelman, Jeremy and Peter Thiel and others},
    ...
}
```
