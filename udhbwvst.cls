\newcommand*{\udhbwvst@cls@date}{2019-08-17}
\newcommand*{\udhbwvst@cls@info}{Unofficial DHBW Villingen-Schwenningen text class}

\ProvidesClass{udhbwvst}[\udhbwvst@cls@date\space\udhbwvst@cls@info]

% load base class

\LoadClass[12pt]{article}

% load essential packages

\RequirePackage{etoolbox}

% load packages

\RequirePackage{fontspec}


% style

% fontspec package
\setsansfont{TeX Gyre Heros} % like Arial
\renewcommand{\familydefault}{\sfdefault}

