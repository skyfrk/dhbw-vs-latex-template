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
    tmargin =   {4cm},
    bmargin =   {2cm},
    lmargin =   {4cm},
    rmargin =   {2cm}
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
    backend     =   biber,
    style       =   authortitle,
    citestyle   =   authortitle,
    hyperref    =   true,
    autocite    =   footnote,
    sortlocale  =   de_DE,
    dashed      =   false,
    maxnames    =   3,
    sorting     =   nymdt,
    sortlocale  =   de_DE
]{biblatex}

% load optional packages (TODO: add if checks)

\RequirePackage{blindtext}

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

\endinput