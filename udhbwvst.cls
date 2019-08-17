\newcommand*{\udhbwvst@cls@date}{2019-08-17}
\newcommand*{\udhbwvst@cls@info}{Unofficial DHBW Villingen-Schwenningen text class}

\ProvidesClass{udhbwvst}[\udhbwvst@cls@date\space\udhbwvst@cls@info]

% load base class

\LoadClass[12pt]{article}

% load essential packages

\RequirePackage{etoolbox}

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

% style

% fontspec package
\setsansfont{TeX Gyre Heros} % like Arial
\renewcommand{\familydefault}{\sfdefault}

