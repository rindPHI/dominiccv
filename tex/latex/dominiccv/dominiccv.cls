\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dominiccv}[2020/06/18 Dominic's Academic CV Template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage[margin=1in]{geometry}
\RequirePackage{fontawesome5}
\RequirePackage{academicons}
\RequirePackage{parskip}
\RequirePackage{xstring}

\RequirePackage[numbers,sort&compress]{natbib}
\renewcommand\bibsection{\section*{\refname}}
\renewcommand{\bibnumfmt}[1]{#1.}
\renewcommand{\bibfont}{\small}

\RequirePackage{multibib}
\newcites{theses}{Theses}
\newcites{conf}{International Conferences}
\newcites{journal}{Scientific Journals}
\newcites{subm}{Under Review}

\RequirePackage{etoolbox}
\patchcmd{\@maketitle}{\@title}{\@title{}, isn't it?}{}{}

\newcommand{\makecvtitle}{
  \begin{center}
    \sffamily\LARGE \textbf{\@author} \(\vert\) {\@title}
  \end{center}
}

\newenvironment{persdata}{%
  \begin{center}%
  \sffamily%
  \newcommand{\address}[1]{\faAddressBook~##1}%
  \newcommand{\mail}[1]{\faEnvelope~\url{##1}}%
  \newcommand{\phone}[1]{\faPhoneSquare~##1}%
  \newcommand{\web}[1]{\faGlobe~\url{##1}}%
  \newcommand{\dblp}[1]{\aidblpSquare~\url{##1}}%
  \newcommand{\gscholar}[1]{\aiGoogleScholarSquare~\url{##1}}%
  \newcommand{\orcid}[1]{\aiOrcid~\url{##1}}%
  %
  \newcommand{\sep}{\quad}%
  \newcommand{\newl}{\\}%
  \newcommand{\newsec}{\\[1ex]}%
}{\end{center}}

\newcommand{\initskip}{\vspace{4ex}}

\newcommand{\cvsection}[1]{
  \@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\sffamily\Large}*%
  {{\bfseries #1}}
}

\newcommand{\subcvsection}[1]{
  \@startsection {subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\sffamily\large}*%
  {{\bfseries #1}}
}

\newcommand{\eduitem}[3]{
  \@startsection {subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\sffamily\large}*%
  {{\bfseries #1}, #2\hfill{}#3}
}

\newcommand{\presitem}[3]{
  \@startsection {subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\sffamily}*%
  {{\bfseries #1}, #2\hfill{}#3}
}

\newcommand{\subsubcvsection}[1]{
  \@startsection {subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\sffamily}*%
  {{\bfseries #1}}
}

\renewcommand*\descriptionlabel[1]{\hspace\labelsep%
  \normalfont\sffamily\bfseries #1%
}

\newcommand{\talktitle}[2][Title]{#1: \textit{``#2''}}
\newcommand{\talklink}[1]{Link: \url{#1}}

\makeatletter
\newcommand{\thesis}[5][\@nil]{%
  \def\tmp{#1}%
  Student: #2 (#3) %
  \hfill{\sffamily #4} \\%
  Title: \textit{``#5''}%
  \ifx\tmp\@nnil\else%
  \\%
  Co-supervisor\IfSubStr{#1}{,}{s}{}: #1
  \fi%
}
\makeatother

\renewcommand{\bibsection}{\cvsection{References}}
\renewcommand\maketitle\makecvtitle
\renewcommand\section\cvsection
\renewcommand\subsection\subcvsection
\renewcommand\subsubsection\subsubcvsection