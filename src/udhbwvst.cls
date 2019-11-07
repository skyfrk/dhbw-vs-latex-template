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
      pdfsubject  = {\ifdef{\dhbwGetTextType}{\dhbwGetTextType}{undefined}},
      pdfauthor   = {\ifdef{\dhbwGetAuthor}{\dhbwGetAuthor}{undefined}},
      pdfcreator  = {Lua\LaTeX},
      pdfproducer = {Lua\LaTeX},
      pdfencoding = {auto},
      pdflang     = {de}
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
\RequirePackage{setspace}
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
    dashed      = false,
    maxnames    = 3,
    sorting     = nymdt,
    sortlocale  = de_DE
]{biblatex}
\RequirePackage{biblatex-ext-tabular}
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
\RequirePackage{xparse}
\RequirePackage{acro}
\RequirePackage[parfill]{parskip}
\RequirePackage[title,titletoc]{appendix}

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

% fix for #21 (long author names in footnotes)
\renewcommand\@makefntext[1]{\leftskip=1em\hskip-0em\@makefnmark#1}

% xcolor package
\definecolor{dhbwRed}{RGB}{226,0,26}

% acro package
\DeclareAcroListStyle{dhbw}{table}{%
  table = longtable,
  table-spec = >{\bfseries}lp{\linewidth}
}

\acsetup{%
  hyperref    = true,
  only-used   = true,
  sort        = true,
  list-style  = dhbw
}

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

% appendix packge
\newcommand*{\Appendixautorefname}{Appendix}
\newcommand*{\Anhangautorefname}{Anhang}

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

% setspace package
\newcommand{\dhbwSetOneHalfLineSpacing}{%
  \setstretch{1.44} % is equal to 1.5 MS Word line spacing
}

\dhbwSetOneHalfLineSpacing

% longtable package
\newcolumntype{L}[1]{%
  >{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% biblatex package
\addbibresource{\udhbwvst@var@bibfile}

\renewcommand{\newunitpunct}{\addcomma\space}
\DeclareDelimFormat{multinamedelim}{\addsemicolon\space}
\DeclareDelimAlias{finalnamedelim}{multinamedelim}
\DeclareNameAlias{sortname}{family-given} % authorlastname, authorfirstname
\DeclareFieldFormat*{shorttitle}{\mkbibbrackets{#1}}
\DeclareFieldFormat{title}{\normalfont{#1}}
\DeclareFieldFormat{subtitle}{\normalfont{#1}}
\DeclareFieldFormat{url}{\url{#1}} % Removes url prefix
\newcommand{\noyear}{\addcomma \space o\adddot J\adddot}
\renewbibmacro*{date}{%
  \iffieldundef{year}
    {\printtext{\noyear}}
    {\printdate}}
\renewbibmacro*{begentry}{%
  \printfield{shorttitle}%
  \printunit*{\addspace}}

\defbibtabular{bibtabular}{\setlength{\LTpre}{0pt}%
  \setlength{\LTpost}{0pt}%
  \renewcommand*{\arraystretch}{2}%
  \begin{longtable}{%
    @{}
    L{\dimexpr0.25\textwidth-\tabcolsep\relax}
    L{\dimexpr0.75\textwidth-\tabcolsep\relax}
    @{}}}
  {\end{longtable}}{\anchorlang{\usebibmacro{tabular:sortname}}\addcolon &
  \driver{\usebibmacro{tabular:omitsortname}} \\}

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

\DeclareFieldFormat{citetitle}{\normalfont{#1}}
\newbibmacro*{dhbwcite}{%
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
   \usebibmacro{dhbwcite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\cite}
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
  \usebibmacro{author}
  \usebibmacro{dhbwcite}}
  {\multicitedelim}
  {\usebibmacro{postnote}\finentry}

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

\NewDocumentEnvironment{dhbwappendices}{}{%
  \edef\eappendices{\noexpand\begin{appendices}}
  \eappendices
  \renewcommand{\thesection}{\Roman{section}}
}{%
  \end{appendices}
}

\newcommand{\dhbwAppendix}[1]{
  \newpage
  \section{}\label{#1}
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
  date                        = \today
}

\newrobustcmd\dhbwSetup[1]{\pgfqkeys{/dhbwSetup}{#1}}

\newcommand{\dhbwSetFontArial}{%
  \setsansfont{Arial}
  \renewcommand{\familydefault}{\sfdefault}
}

\newcommand{\dhbwSetFontTimesNewRoman}{%
  \setmainfont{Times New Roman}
  \renewcommand{\familydefault}{\rmdefault}
}


\newcommand{\dhbwSetFrontMatter}{%
  \selectlanguage{ngerman}
  \pagenumbering{Alph}
  \pagestyle{empty}
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
  \onehalfspacing % there is enough space by default
  \pagenumbering{Roman}
  \addtocontents{toc}{\protect\thispagestyle{empty}} % no page number for multipage tocs
  \tableofcontents
  \thispagestyle{empty}
  \dhbwSetOneHalfLineSpacing
}

\newcommand{\dhbwSetListMatter}{%
  \newpage
  \pagestyle{plain}
}

\newcommand{\dhbwPrintListOfAcronyms}{%
  \ifbool{udhbwvst@if@print@loa}{%
    \newpage
    \phantomsection
    \addcontentsline{toc}{section}{Abkürzungsverzeichnis}
    \printacronyms[name=Abkürzungsverzeichnis]
    \addtocounter{table}{-1} % \printacronyms with longtable adds 1 to the table counter
  }{}
} 

\newcommand{\dhbwPrintListOfFigures}{%
  \ifbool{udhbwvst@if@print@lof}{%
    \newpage
    \phantomsection
    \addcontentsline{toc}{section}{\listfigurename}
    \listoffigures
  }{}
}

\newcommand{\dhbwPrintListOfTables}{%
  \ifbool{udhbwvst@if@print@lot}{%
    \newpage
    \phantomsection
    \addcontentsline{toc}{section}{\listtablename}
    \listoftables
  }{}
}

\newcommand{\dhbwPrintListOfListings}{%
  \ifbool{udhbwvst@if@print@lol}{%
    \newpage
    \phantomsection
    \addcontentsline{toc}{section}{\lstlistlistingname}
    \lstlistoflistings
  }{}
}

\newcommand{\dhbwSetMainMatter}{%
  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\dhbwPrintBibliography}{%
  \newpage
  \singlespacing
  \phantomsection
  \addcontentsline{toc}{section}{\udhbwvst@var@bibliographyname}
  \printbibtabular[title=\udhbwvst@var@bibliographyname]
  \dhbwSetOneHalfLineSpacing
}

\newcommand{\dhbwPrintIndependenceNotice}{%
  \newpage
  \phantomsection
  \addcontentsline{toc}{section}{Selbstständigkeitserklärung}
  \section*{Selbstständigkeitserklärung}
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