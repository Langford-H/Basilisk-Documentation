\ProvidesClass{BasiliskD}

% -------------------
% Base Class
% -------------------

% Declare conditional for options
\newif\ifsingle
\newif\ifshowcode
\showcodetrue  % Show code by default
\singlefalse


% Declare options
\DeclareOption{single}{\singletrue}
\DeclareOption{hidecode}{\showcodefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % Pass unrecognized options to book by default

% Process options
\ProcessOptions\relax

% Load the appropriate class and configure chapter/section
\ifsingle
  \LoadClass[12pt,oneside,a4paper]{article}
  % Define \chapter to set the document title
  \newcommand{\chapter}[1]{\title{#1}}
\else
  \LoadClass[12pt,oneside,a4paper]{book}
  \renewcommand{\thechapter}{\arabic{chapter}}
\fi

% -------------------
% Package Dependencies
% -------------------
\RequirePackage[table]{xcolor}        % Color support, must load first
\RequirePackage{geometry}             % Page layout configuration
\RequirePackage{amsmath}              % Mathematical typesetting
\RequirePackage{graphicx}             % Enhanced graphics support
\RequirePackage{graphics}             % Basic graphics support
\RequirePackage{tikz}                 % Diagram and drawing support
\usetikzlibrary{shapes,arrows,matrix,positioning}
\RequirePackage{minted}               % Syntax-highlighted code blocks
\RequirePackage{indentfirst}          % Indent first paragraphs
\RequirePackage{multicol}             % Multi-column layouts
\RequirePackage{mathrsfs}             % Alphabet in mathrcs
\RequirePackage{subcaption}           % Subfigures and captions
\RequirePackage{fancyhdr}             % Custom headers and footers
\RequirePackage{titlesec}             % Custom section titles
\RequirePackage{hyperref}             % Hyperlinks and PDF metadata
\RequirePackage[refsection=chapter]{biblatex} % Bibliography per chapter
\RequirePackage{kvoptions}            % Option parsing for bibliography path
\RequirePackage{xparse}               % Advanced command definitions
\RequirePackage{romannum}             % Roman number

% -------------------
% Page Layout
% -------------------
\geometry{
  margin=1in,
  top=1.5in,
  headheight=16pt,  % Prevents header overlap
  headsep=0.3in    % Space between header and text
}

% -------------------
% Color Definitions
% -------------------
\definecolor{codebg}{RGB}{230,255,253}   % Background for code blocks
\definecolor{function}{RGB}{210,0,26}    % Function names
\definecolor{para}{RGB}{255,137,137}     % Parameters déficité
\definecolor{output}{RGB}{238,224,201}   % Output blocks

\newcommand{\target}{\tikz \fill[brown] (2pt,2pt) rectangle (8pt,8pt);}
\newcommand{\activetest}{\tikz \fill[black] (3pt,3pt) circle (3pt);}
\newcommand{\prolong}{\tikz \fill[blue] (3pt,3pt) circle (3pt);}
\newcommand{\rest}{\tikz \fill[red] (3pt,3pt) circle (3pt);}

% -------------------
% Code Formatting
% -------------------
% Minted configuration for C++ code
\setminted[cpp]{
  mathescape=true,
  breaklines=true,
  bgcolor=codebg,
  linenos=true
}

% TikZ styles for code visualization
\tikzset{
  block/.style={
    rectangle,
    draw,
    fill=output,
    text width=\textwidth,
    text centered,
    rounded corners,
    minimum height=4em
  },
  line/.style={draw, -latex'}
}

% Command for code comments in TikZ blocks
\NewDocumentCommand{\codecomment}{m}{%
  \noindent
  \begin{tikzpicture}
    \node [block] {#1};
  \end{tikzpicture}
}

% Command for downward arrow in code flow
\newcommand{\codearrow}{%
  \begin{center}
    \begin{tikzpicture}
      \draw[-latex,thick](0,0) -- (0,-1);
    \end{tikzpicture}
  \end{center}
}

% Custom code section environment
\newenvironment{codesection}[2]{% #1 = sectioning command, #2 = title
  \ifshowcode
    \csname #1\endcsname{#2}
    \par\vspace{1em}\noindent\vspace{0.5em}\par
    \begingroup
  \else
    \setbox0=\vbox\bgroup  % Discard content if hidden
  \fi
}{%
  \ifshowcode
    \par\vspace{1em}\noindent\vspace{0.5em}\par
    \endgroup
  \else
    \egroup  % End discarded content
  \fi
}

% -------------------
% Bibliography Configuration
% -------------------
\SetupKeyvalOptions{
  family=BasiliskD,
  prefix=BasiliskD@
}
\DeclareStringOption[bibliography.bib]{bibpath}
\ProcessKeyvalOptions*
\addbibresource{\BasiliskD@bibpath}

% -------------------
% Custom Commands
% -------------------
% Formatting for functions and parameters
\newcommand{\func}[1]{\textbf{\textcolor{function}{#1}}}  % Function name
\newcommand{\para}[1]{\textbf{\emph{\textcolor{para}{#1}}}}  % Parameter

% Chapter metadata (version and date)
\newcommand{\chapterversion}{1.0}
\newcommand{\chapterupdatedate}{\today}
\NewDocumentCommand{\chaptermeta}{O{1.0} O{\today}}{%
  \renewcommand{\chapterversion}{#1}%
  \renewcommand{\chapterupdatedate}{#2}%
  \vspace{-1.5em}%
  \begin{flushright}
    \textit{Version: #1 \quad Updated: #2}
  \end{flushright}
  \vspace{1em}
}

% -------------------
% Document Metadata
% -------------------
\author{Haochen (Langford) Huang}
\date{\today}

% -------------------
% Formatting and Styling
% -------------------
% Table of contents depth

% Chapter/section title format
\ifsingle
  \setcounter{secnumdepth}{3}  % Number up to subsubsection
  \setcounter{tocdepth}{3}     % Include up to subsubsection in TOC
  \titleformat{\section}[display]
    {\normalfont\Huge\bfseries}
    {Section\ \thesection}
    {20pt}
    {\Huge}
  \titleformat{\subsection}[hang]
    {\normalfont\Large\bfseries}
    {\thesubsection}
    {5pt}
    {}
  \titleformat{\subsubsection}
    {\normalfont\large}
    {\thesubsubsection}
    {5pt}
    {}
\else
  \setcounter{secnumdepth}{2}
  \setcounter{tocdepth}{2}
  \titleformat{\chapter}[display]
    {\normalfont\Huge\bfseries}
    {\chaptername\ \thechapter}
    {20pt}
    {\Huge}
\fi

% Header and footer setup with conditional checks
\pagestyle{fancy}
\fancyhf{}
% Ensure chapterversion and chapterupdatedate are defined
\providecommand{\chapterversion}{1.0}
\providecommand{\chapterupdatedate}{\today}
\ifsingle
  \fancyhead[L]{\leftmark\quad\textit{V-\chapterversion{} \chapterupdatedate}}
\else
  \fancyhead[L]{\leftmark\quad\textit{V-\chapterversion{} \chapterupdatedate}}
\fi
\fancyhead[R]{\thepage}
