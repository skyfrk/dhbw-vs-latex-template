% settings

\newcommand*{\udhbwvst@cls@date}{2019-08-17}
\newcommand*{\udhbwvst@cls@info}{Unofficial DHBW Villingen-Schwenningen text class}
\newcommand*{\udhbwvst@var@shortreferenceprefix}{Quelle:\space}
\newcommand*{\udhbwvst@var@defaultshortreference}{Eigene Darstellung}
\newcommand*{\udhbwvst@var@indirectciteprefix}{Vgl\adddot}
\newcommand*{\udhbwvst@var@bibliographyname}{Literaturverzeichnis}

% setup

\ProvidesClass{udhbwvst}[\udhbwvst@cls@date\space\udhbwvst@cls@info]
\LoadClass[12pt]{article}

% load essential packages

\RequirePackage{etoolbox, pgfopts}

% booleans

\newbool{udhbwvst@if@debug}
\newbool{udhbwvst@if@autogenerate}\booltrue{udhbwvst@if@autogenerate}
\newbool{udhbwvst@if@print@ndn}\booltrue{udhbwvst@if@print@ndn}
\newbool{udhbwvst@if@print@loa}\booltrue{udhbwvst@if@print@loa}
\newbool{udhbwvst@if@print@lof}\booltrue{udhbwvst@if@print@lof}
\newbool{udhbwvst@if@print@lot}\booltrue{udhbwvst@if@print@lot}
\newbool{udhbwvst@if@print@lol}\booltrue{udhbwvst@if@print@lol}
\newbool{udhbwvst@if@plantuml}

% define options

\pgfkeys{%
    udhbwvst/.cd,
    auto-generate/.is if    = udhbwvst@if@autogenerate,
    debug/.is if            = udhbwvst@if@debug,
    print-ndn/.is if        = udhbwvst@if@print@ndn,
    print-loa/.is if        = udhbwvst@if@print@loa,
    print-lof/.is if        = udhbwvst@if@print@lof,
    print-lot/.is if        = udhbwvst@if@print@lot,
    print-lol/.is if        = udhbwvst@if@print@lol,
    bib-file/.store in      = \udhbwvst@var@bibfile,
    bib-file                = literature.bib,
    plantuml/.is if         = udhbwvst@if@plantuml
}

\ProcessPgfOptions{/udhbwvst}

% load packages

\AtEndPreamble{%
    \RequirePackage{hyperref}
    \urlstyle{same}
    \ifbool{udhbwvst@if@debug}{}{%
        \hypersetup{hidelinks}
    }
    \hypersetup{%
      pdftitle    = {\ifdef{\dhbwGetTitle}{\dhbwGetTitle}{undefined}},
      pdfsubject  = {\ifdef{\dhbwGetTitle}{\dhbwGetTitle}{undefined}},
      pdfauthor   = {\ifdef{\dhbwGetAuthor}{\dhbwGetAuthor}{undefined}},
      pdfcreator  = {Lua\LaTeX},
      pdfproducer = {Lua\LaTeX}
    }
}

\RequirePackage{fontspec}
\RequirePackage[%
    a4paper,
    tmargin = {4cm},
    bmargin = {2cm},
    lmargin = {4cm},
    rmargin = {2cm}
]{geometry}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[official]{eurosym}
\RequirePackage[ngerman]{babel}
\RequirePackage[autostyle=true,german=quotes]{csquotes}
\RequirePackage[bottom]{footmisc}
\RequirePackage{pgfkeys}
\RequirePackage{fancyhdr}
\RequirePackage[%
    backend     = biber,
    style       = authortitle,
    citestyle   = authortitle,
    hyperref    = true,
    autocite    = footnote,
    sortlocale  = de_DE,
    dashed      = false,
    maxnames    = 3,
    sorting     = nymdt,
    sortlocale  = de_DE
]{biblatex}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage[subfigure]{tocloft}
\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{bmpsize}
\RequirePackage{wrapfig}
\RequirePackage{subfigure}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage[printonlyused]{acronym}
\RequirePackage{xparse}
\RequirePackage[parfill]{parskip}

% load optional packages

\ifbool{udhbwvst@if@plantuml}{%
  \RequirePackage{plantuml}
}{}

\ifbool{udhbwvst@if@debug}{%
  \RequirePackage{blindtext, lipsum}
}{}

\ifbool{udhbwvst@if@print@ndn}{%
  \RequirePackage{rotating}
  \RequirePackage[absolute]{textpos}
}{}

% style

% fontspec package
\setsansfont{TeX Gyre Heros} % like Arial
\renewcommand{\familydefault}{\sfdefault}

% fancyhdr package
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt} % No line below the page number
\fancypagestyle{plain}{
  \fancyhead[R]{\thepage}
}
\setlength{\headheight}{15pt}

% change page numbering style without page number reset
\newcommand\pagenumberingnoreset[1]{\gdef\thepage{\csname @#1\endcsname\c@page}}

% fix for #21 (long author names in footnotes)
\renewcommand\@makefntext[1]{\leftskip=1em\hskip-0em\@makefnmark#1}

% xcolor package
\definecolor{dhbwRed}{RGB}{226,0,26}

% tocloft package
\renewcommand{\cftfigpresnum}{Abbildung }
\renewcommand{\cfttabpresnum}{Tabelle }  
\renewcommand{\cftfigaftersnum}{:}
\renewcommand{\cfttabaftersnum}{:}
\newlength{\ctmfignumwidth}
\newlength{\ctmtabnumwidth}
\settowidth{\ctmfignumwidth}{\cftfigpresnum}
\settowidth{\ctmtabnumwidth}{\cfttabpresnum}
\setlength{\cftfignumwidth}{\dimexpr\ctmfignumwidth+1.5em}
\setlength{\cfttabnumwidth}{\dimexpr\ctmtabnumwidth+1.5em}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

% caption package
\captionsetup{font={singlespacing}}

% listings package
\lstdefinestyle{base}{%
  showspaces        = false,
  showtabs          = false,
  frame             = single,
  breaklines        = true,
  numbers           = left,
  showstringspaces  = false,
  breakatwhitespace = true,
  escapeinside      = {(*@}{@*)},
  basicstyle        = \footnotesize\ttfamily,
  belowcaptionskip  = 13pt
}
\lstset{style=base}

\definecolor{bluekeywords}{rgb}{0.13,0.13,1}
\definecolor{greencomments}{rgb}{0,0.5,0}
\definecolor{redstrings}{rgb}{0.9,0,0}

\lstdefinelanguage{csharp}{%
  language      = [Sharp]C,
  commentstyle  = \color{greencomments},
  keywordstyle  = \color{bluekeywords}\bfseries,
  stringstyle   = \color{redstrings}
}

\definecolor{lightgray}{rgb}{0.9, 0.9, 0.9}
\definecolor{darkgray}{rgb}{0.4, 0.4, 0.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

\lstdefinelanguage{javascript}{%
  keywords          = {%
    break,
    case,
    catch,
    continue,
    debugger,
    default,
    delete, 
    do,
    else,
    false,
    finally,
    for,
    function,
    if,
    in,
    instanceof,
    new,
    null,
    return,
    switch,
    this,
    throw,
    true,
    try,
    typeof,
    var,
    void,
    while,
    with
  },
  morecomment       = [l]{//},
  morecomment       = [s]{/*}{*/},
  morestring        = [b]',
  morestring        = [b]",
  ndkeywords        = {%
    class,
    export,
    boolean,
    throw,
    implements,
    import,
    this
  },
  keywordstyle      = \color{blue}\bfseries,
  ndkeywordstyle    = \color{darkgray}\bfseries,
  identifierstyle   = \color{black},
  commentstyle      = \color{purple}\ttfamily,
  stringstyle       = \color{red}\ttfamily,
  sensitive         = true
}

\renewcommand{\lstlistingname}{Quellcode}
\renewcommand{\lstlistlistingname}{Quellcodeverzeichnis}

% biblatex package
\addbibresource{\udhbwvst@var@bibfile}

% Delimitors
\DeclareDelimFormat[bib,biblist]{nametitledelim}{\addcolon\space}
\renewcommand{\newunitpunct}{\addcomma\space}
\DeclareDelimFormat{multinamedelim}{\addsemicolon\space}
\DeclareDelimAlias{finalnamedelim}{multinamedelim}

% Print always: authorlastname, authorfirstname
\DeclareNameAlias{sortname}{family-given}

% Shorttitle in parens
\DeclareFieldFormat*{shorttitle}{\mkbibparens{#1}}

% No italics in title and subtitle
\DeclareFieldFormat{title}{\normalfont{#1}}
\DeclareFieldFormat{subtitle}{\normalfont{#1}}

% Removes url prefix
\DeclareFieldFormat{url}{\url{#1}}

% Adds o.J. if no date is given:
\newcommand{\noyear}{\addcomma \space o\adddot J\adddot}
\renewbibmacro*{date}{%
  \iffieldundef{year}
    {\printtext{\noyear}}
    {\printdate}}

% User-level command for printing tabular bibliography
\let\printbibtabular\printbibliography
\patchcmd{\printbibtabular}{\blx@printbibliography}{\bbx@printbibtabular}{}{}
\patchcmd{\printbibtabular}{\blx@printbibliography}{\bbx@printbibtabular}{}{}
\let\bbx@printbibtabular\blx@printbibliography
\patchcmd{\bbx@printbibtabular}{\blx@bibliography}{\bbx@bibtabular}{}{}
\patchcmd{\bbx@printbibtabular}{\def\blx@theenv{bibliography}}{\def\blx@theenv{bibtabular}}{}{}

% Underlying macros
\def\bbx@bibtabular#1{%
  \blx@langstrings
  \blx@bibheading\blx@theheading\blx@thetitle
  \blx@bibnote\blx@theprenote
  \begingroup
  \blx@bibinit
  \let\@noitemerr\@empty
  \let\blx@noitem\blx@warn@bibempty
  \ifnum\bibinitsep=\z@
    \let\blx@initsep\relax
  \fi
  \ifnum\bibnamesep=\z@
    \let\blx@namesep\relax
  \fi
  \csuse{blx@hook@bibinit}%
  \csuse{blx@hook@bibinit@next}%
  % copy filtered list of entries to internal list macro
  \def\blx@do##1{%
    \blx@ifdata{##1}{%
      \begingroup
      \blx@getdata{##1}%
      \blx@bibcheck
      \iftoggle{blx@skipentry}{}{%
        \global\let\blx@noitem\@empty
        \listadd\blx@tempa{##1}}%
      \endgroup}{}}%
  \let\blx@done\relax
  \blx@listloop{#1}%
  % tabular output for each item in list macro
  \def\do##1{\bbx@tab@label{##1} & \bbx@tab@item{##1}\\}%
  \csuse{blx@env@\blx@theenv}%
  \dolistloop{\blx@tempa}%
  \csuse{blx@endenv@\blx@theenv}%
  \blx@bibnote\blx@thepostnote
  \endgroup
  \endgroup% this closed a goup opened by \printbibtabular
}

\def\bbx@tab@label#1{%
  \begingroup
  \blx@getdata{#1}%
  \blx@setdefaultrefcontext{#1}%
  \blx@setoptions@type\abx@field@entrytype
  \blx@setoptions@entry
  \blx@thelabelnumber
  \blx@initsep
  \blx@namesep
  \csuse{blx@hook@bibitem}%
  \addtocounter{instcount}\@ne
  \blx@anchor
  \csuse{bbx@tabenv@\blx@theenv}\relax
  \endgroup
}

\def\bbx@tab@item#1{%
  \begingroup
  \blx@getdata{#1}%
  \blx@setoptions@type\abx@field@entrytype
  \blx@setoptions@entry
  \blx@thelabelnumber
  \csuse{blx@hook@bibitem}%
  \csuse{blx@item@\blx@theenv}\relax
  \blx@execute
  \blx@initunit
  \blx@beglangbib
  \bibsentence
  \blx@pagetracker
  \blx@driver\abx@field@entrytype
  \blx@postpunct
  \blx@endlangbib
  \endgroup
}

% User-level command for defining tabular bibliography format
\newrobustcmd*{\defbibtabular}[5]{%
  \long\csdef{blx@env@#1}{#2}%
  \long\csdef{blx@endenv@#1}{#3}%
  \long\csdef{bbx@tabenv@#1}{#4}%
  \long\csdef{blx@item@#1}{#5}}

% Sortname labels (a robust style should add provision for missing labelnames)
\newbibmacro*{sortname}{%
  \ifnameundef{labelname}
    {\printtext[bold]{No name given.}%
     \PackageWarning{biblatex}{No labelname for entry \thefield{entrykey},\MessageBreak
       we need to think of something else}}
    {\printnames[sortname]{labelname}%
     \iffieldequalstr{labelnamesource}{editor}
       {\setunit{\printdelim{editortypedelim}}%
        \usebibmacro{editor+othersstrg}}
       {\iffieldequalstr{labelnamesource}{translator}
          {\setunit{\printdelim{translatortypedelim}}%
           \usebibmacro{translator+othersstrg}}
          {}}}}

% Bibitem hook to suppress redundant sortname list
\newbibmacro*{omitsortname}{%
  \ifnameundef{labelname}
    {}
    {\clearname{\thefield{labelnamesource}}}}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

\defbibtabular{bibtabular}
  {\def\arraystretch{2}%
   \begin{longtable}{@{}L{\dimexpr0.25\textwidth-\tabcolsep\relax}L{\dimexpr0.75\textwidth-\tabcolsep\relax}@{}}}
  {\end{longtable}}
  {\usebibmacro{sortname}}
  {\usebibmacro{omitsortname}}

\renewbibmacro*{begentry}{%
  \printfield{shorttitle}%
  \printunit*{\addspace}}

% Sort by Author->Year->Month->Day->Title
\DeclareSortingTemplate{nymdt}{
  \sort{
    \field{presort}
  }
  \sort[final]{
    \field{sortkey}
  }
  \sort{
    \field{sortname}
    \field{author}
    \field{editor}
    \field{translator}
    \field{sorttitle}
    \field{title}
  }
  \sort{
    \field{sortyear}
    \field{year}
  }
  \sort{
    \field[padside=left,padwidth=2,padchar=0]{month}
    \literal{00}
  }
  \sort{
    \field[padside=left,padwidth=2,padchar=0]{day}
    \literal{00}
  }
  \sort{
    \field{sorttitle}
  }
  \sort{
    \field[padside=left,padwidth=4,padchar=0]{volume}
    \literal{0000}
  }
}

% No italics
\DeclareFieldFormat{citetitle}{\normalfont{#1}}

% Custom cite bibmacro
\newbibmacro*{mycite}{%
  \printtext[bibhyperref]{%
    \printfield[citetitle]{labeltitle}
    \setunit{\addcomma\space}
    \iffieldundef{year}
     {\noyear}
    {\printfield{year}}}}

% command definitions

\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{author}
   \usebibmacro{mycite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\cite}
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
  \usebibmacro{author}
  \usebibmacro{mycite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\NewDocumentCommand{\dfootcite}{O{}mm}{%
  \enquote{#3}{\footcite[#1]{#2}}
}

\NewDocumentCommand{\ifootcite}{O{}m}{%
  \footcite[\udhbwvst@var@indirectciteprefix][#1]{#2}
}

\NewDocumentCommand{\icite}{O{}m}{%
  \cite[\udhbwvst@var@indirectciteprefix][#1]{#2}
}

\pgfkeys{%
  /dhbwFigure/.is family,
  /dhbwFigure,
  caption/.estore in  = \udhbwvst@cmd@dhbwfigure@caption,
  path/.estore in     = \udhbwvst@cmd@dhbwfigure@path,
  label/.estore in    = \udhbwvst@cmd@dhbwfigure@label,
  source/.estore in   = \udhbwvst@cmd@dhbwfigure@source,
  source              = \udhbwvst@var@defaultshortreference,
  width/.estore in    = \udhbwvst@cmd@dhbwfigure@width,
  width               = \textwidth,
  float/.estore in    = \udhbwvst@cmd@dhbwfigure@float,
  float               = ht
}

\newcommand{\dhbwFigure}[1]{
  \pgfkeys{/dhbwFigure, #1}
  \edef\efigure{\noexpand\begin{figure}[\udhbwvst@cmd@dhbwfigure@float]}
  \efigure
    \centering
    \caption{\udhbwvst@cmd@dhbwfigure@caption}
    \includegraphics[width=\udhbwvst@cmd@dhbwfigure@width]{\udhbwvst@cmd@dhbwfigure@path} 
    \caption*{\footnotesize{\udhbwvst@var@shortreferenceprefix\udhbwvst@cmd@dhbwfigure@source}}
    \label{\udhbwvst@cmd@dhbwfigure@label}
  \end{figure}
}

\pgfkeys{%
  /dhbwFigureEnv/.is family,
  /dhbwFigureEnv,
  caption/.estore in  = \udhbwvst@cmd@dhbwfigureenv@caption,
  label/.estore in    = \udhbwvst@cmd@dhbwfigureenv@label,
  float/.estore in    = \udhbwvst@cmd@dhbwfigureenv@float,
  float               = ht,
  source/.estore in   = \udhbwvst@cmd@dhbwfigureenv@source,
  source              = \udhbwvst@var@defaultshortreference
}

\NewDocumentEnvironment{dhbwfigure}{m}{%
  \pgfkeys{/dhbwFigureEnv, #1}
  \edef\efigure{\noexpand\begin{figure}[\udhbwvst@cmd@dhbwfigureenv@float]}
  \efigure
    \centering
    \caption{\udhbwvst@cmd@dhbwfigureenv@caption}
}{%
    \caption*{\footnotesize{\udhbwvst@var@shortreferenceprefix{}\udhbwvst@cmd@dhbwfigureenv@source}}
    \label{\udhbwvst@cmd@dhbwfigureenv@label}
  \end{figure}
}

\pgfkeys{%
  /dhbwWrapfigure/.is family,
  /dhbwWrapfigure,
  caption/.estore in        = \udhbwvst@cmd@dhbwwrapfigure@caption,
  label/.estore in          = \udhbwvst@cmd@dhbwwrapfigure@label,
  source/.estore in         = \udhbwvst@cmd@dhbwwrapfigure@source,
  source                    = \udhbwvst@var@defaultshortreference,
  placement/.estore in      = \udhbwvst@cmd@dhbwwrapfigure@placement,
  placement                 = R,
  width/.store in           = \udhbwvst@cmd@dhbwwrapfigure@width,
  width                     = {0.45\textwidth},
  image width/.store in     = \udhbwvst@cmd@dhbwwrapfigure@imgwidth,
  image width               = {0.4\textwidth},
  path/.estore in           = \udhbwvst@cmd@dhbwwrapfigure@path
}

\newcommand{\dhbwWrapfigure}[1]{
  \pgfkeys{/dhbwWrapfigure, #1}
  \begin{wrapfigure}{\udhbwvst@cmd@dhbwwrapfigure@placement}{\udhbwvst@cmd@dhbwwrapfigure@width}
    \centering
    \caption{\udhbwvst@cmd@dhbwwrapfigure@caption}
    \includegraphics[width=\udhbwvst@cmd@dhbwwrapfigure@imgwidth]{\udhbwvst@cmd@dhbwwrapfigure@path} 
    \caption*{\footnotesize{\udhbwvst@var@shortreferenceprefix{}\udhbwvst@cmd@dhbwwrapfigure@source}}
    \label{\udhbwvst@cmd@dhbwwrapfigure@label}
  \end{wrapfigure}
}

\pgfkeys{%
  /dhbwTableEnv/.is family,
  /dhbwTableEnv,
  caption/.estore in  = \udhbwvst@cmd@dhbwtableenv@caption,
  label/.estore in    = \udhbwvst@cmd@dhbwtableenv@label,
  float/.estore in    = \udhbwvst@cmd@dhbwtableenv@float,
  float               = ht,
  source/.estore in   = \udhbwvst@cmd@dhbwtableenv@source,
  source              = \udhbwvst@var@defaultshortreference
}

\NewDocumentEnvironment{dhbwtable}{m}{%
  \pgfkeys{/dhbwTableEnv, #1}
  \edef\etable{\noexpand\begin{table}[\udhbwvst@cmd@dhbwtableenv@float]}
  \etable
    \centering
    \caption{\udhbwvst@cmd@dhbwtableenv@caption}
}{%
  \setlength\belowcaptionskip{4pt}
  \caption*{\footnotesize{\udhbwvst@var@shortreferenceprefix{}\udhbwvst@cmd@dhbwtableenv@source}}
  \label{\udhbwvst@cmd@dhbwtableenv@label}
  \end{table}
}

\lstnewenvironment{code}[2]{%
  \lstset{#1}
}{%
  \begin{center}
    \setlength\abovecaptionskip{-2pt}
    \captionof*{figure}{\footnotesize{\udhbwvst@var@shortreferenceprefix#2}}
  \end{center}
}

\pgfkeys{%
  /dhbwSetup/.cd,
  author/.store in            = \dhbwGetAuthor,
  faculty/.store in           = \dhbwGetFaculty,
  field of study/.store in    = \dhbwGetFieldOfStudy,
  academic year/.store in     = \dhbwGetAcademicYear,
  course/.store in            = \dhbwGetCourse,
  title/.store in             = \dhbwGetTitle,
  subtitle/.store in          = \dhbwGetSubtitle,
  text type/.store in         = \dhbwGetTextType,
  company name/.store in      = \dhbwGetCompanyName,
  company logo/.store in      = \dhbwGetCompanyLogo,
  lecturer/.store in          = \dhbwGetLecturer,
  location/.store in          = \dhbwGetLocation,
  location                    = Villingen-Schwenningen,
  date/.store in              = \dhbwGetDate,
  date                        = \today,
  longest acronym/.store in   = \dhbwGetLongestAcronym,
  longest acronym             = xD,
  acronyms/.store in          = \dhbwGetAcronyms,
  acronyms                    = {}
}

\newrobustcmd\dhbwSetup[1]{\pgfqkeys{/dhbwSetup}{#1}}

\newcommand{\dhbwSetFrontMatter}{%
  \selectlanguage{ngerman}
  \pagenumbering{gobble}
}

\newcommand{\dhbwPrintTitle}{%
  \input{udhbwvst-title.def}
}

\newcommand{\dhbwPrintNonDisclosureNotice}{%
  \ifbool{udhbwvst@if@print@ndn}{%
    \newpage  
    \input{udhbwvst-non-disclosure-notice.def}
  }{}
}

\newcommand{\dhbwPrintTableOfContents}{%
  \newpage
  \setcounter{page}{2}
  \tableofcontents
}

\newcommand{\dhbwSetListMatter}{%
  \newpage
  \pagenumberingnoreset{Roman}
}

\newcommand{\dhbwPrintListOfAcronyms}{%
  \ifbool{udhbwvst@if@print@loa}{%
    \newpage
    \section*{Abkürzungsverzeichnis}\addcontentsline{toc}{section}{Abkürzungsverzeichnis}
    \begin{acronym}[\dhbwGetLongestAcronym{}\dhbwGetLongestAcronym{}] % spacing between acronym and long name
      \setlength{\itemsep}{-\parsep} % line spacing
      \dhbwGetAcronyms
    \end{acronym}
  }{}
} 

\newcommand{\dhbwPrintListOfFigures}{%
  \ifbool{udhbwvst@if@print@lof}{%
    \newpage
    \listoffigures\addcontentsline{toc}{section}{\listfigurename}
  }{}
}

\newcommand{\dhbwPrintListOfTables}{%
  \ifbool{udhbwvst@if@print@lot}{%
    \newpage
    \listoftables\addcontentsline{toc}{section}{\listtablename}
  }{}
}

\newcommand{\dhbwPrintListOfListings}{%
  \ifbool{udhbwvst@if@print@lol}{%
    \newpage
    \lstlistoflistings\addcontentsline{toc}{section}{\lstlistlistingname}
  }{}
}

\newcommand{\dhbwSetMainMatter}{%
  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\dhbwPrintBibliography}{%
  \newpage
  \printbibtabular[title=\udhbwvst@var@bibliographyname]\addcontentsline{toc}{section}{\udhbwvst@var@bibliographyname}
}

\newcommand{\dhbwPrintIndependenceNotice}{%
  \newpage
  \input{udhbwvst-independence-notice.def}
}

\newcommand{\dhbwPrintEverythingBefore}{%
  \dhbwSetFrontMatter
  \dhbwPrintTitle
  \dhbwPrintNonDisclosureNotice
  \dhbwPrintTableOfContents
  \dhbwSetListMatter
  \dhbwPrintListOfAcronyms
  \dhbwPrintListOfFigures
  \dhbwPrintListOfTables
  \dhbwPrintListOfListings
  \dhbwSetMainMatter
}

\newcommand{\dhbwPrintEverythingAfter}{%
  \dhbwPrintBibliography
  \dhbwPrintIndependenceNotice
}

% generate pages

\AfterEndPreamble{%
  \ifbool{udhbwvst@if@autogenerate}{%
    \dhbwPrintEverythingBefore
  }{}
}

\AtEndDocument{%
  \ifbool{udhbwvst@if@autogenerate}{%
    \dhbwPrintEverythingAfter
  }{}
}

\endinput