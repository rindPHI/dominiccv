\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dscoverlttr}[2020/07/01 Dominic's Cover Letter Template]

\DeclareOption{fromemail}{\def\fromemail{}}
\DeclareOption{fromurl}{\def\fromurl{}}
\DeclareOption{fromphone}{\def\fromphone{}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\ProcessOptions\relax

\LoadClass{scrlttr2}

\RequirePackage{lmodern}
\RequirePackage[english]{babel}
\RequirePackage{url}

\RequirePackage{fontawesome5}
\RequirePackage{academicons}
\RequirePackage{parskip}
\setkomafont{fromname}{\sffamily\bfseries}
\setkomafont{fromaddress}{\sffamily}
\setkomafont{addressee}{\sffamily}

\setkomavar{firsthead}{%
  \begin{center}%
    {\usekomafont{fromname}\usekomavar{fromname}}\\%
    {\usekomafont{fromaddress}%
      \faAddressBook~\usekomavar{fromaddress}%
      \ifcsname fromphone\endcsname\\\faPhoneSquare~\usekomavar{fromphone}%
      \ifcsname fromemail\endcsname\quad\fi\else\ifcsname fromemail\endcsname\\\fi\fi%
      \ifcsname fromemail\endcsname\faEnvelope~\usekomavar{fromemail}\fi%
      \ifcsname fromurl\endcsname\\\faGlobe~\texttt{\usekomavar{fromurl}}\fi%
    }%
  \end{center}%
}%
