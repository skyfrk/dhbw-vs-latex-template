\newcommand*{\udhbwvst@cls@date}{2019-08-17}
\newcommand*{\udhbwvst@cls@info}{Unofficial DHBW Villingen-Schwenningen text class}

\ProvidesClass{udhbwvst}[\udhbwvst@cls@date\space\udhbwvst@cls@info]

% load base class

\LoadClass[12pt]{article}

% load essential packages

\RequirePackage{etoolbox}

\AtEndPreamble{%
    \RequirePackage{hyperref}
    \urlstyle{same}
    \hypersetup{hidelinks}
}

% load packages

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
\RequirePackage{plantuml}

% load optional packages (TODO: add if checks)

\RequirePackage{blindtext}
\usepackage{rotating}
\usepackage[absolute]{textpos}

% style

% fontspec package
\setsansfont{TeX Gyre Heros} % like Arial
\renewcommand{\familydefault}{\sfdefault}

% babel package
\addto\captionsngerman{%
    \renewcommand{\contentsname}{Literaturverzeichnis}
}

% fancyhdr package
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt} % No line below the page number
\fancypagestyle{plain}{
  \fancyhead[R]{\thepage}
}

% fix for #21 (long author names in footnotes)
\renewcommand\@makefntext[1]{\leftskip=1em\hskip-0em\@makefnmark#1}

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
\captionsetup[table]{skip=10pt,font={stretch=1}}
\captionsetup[figure]{font={stretch=1}}

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
  belowcaptionskip  = \baselineskip
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

\endinput