%
% This script is available under the MIT license;
% the license information is found in 'LICENSE'.
%


%
% "bioeng.cls": LaTeX2e custom class built on top of the LaTeX2e article class
%
% This class emulates the MS-Word template for the extended thesis
% abstract of the Depatment of Bioengineering, University of Tokyo.
%
% Jaewoong Jang
% PhD student
% University of Tokyo
% jang.comsci@gmail.com
%


%
% Class identification
%
\newcommand\bioengName{bioeng}
\newcommand\bioengTitl{A LaTeX2e class for UTokyo Bioeng. defense abstract}
\newcommand\bioengVers{v1.0.0}
\newcommand\bioengDateLast{2018/07/04} % Must be in the form 'yyyy/mm/dd'
\newcommand\bioengDateFirst{2018/06/19}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\bioengName}[\bioengDateLast\space\bioengVers]

\typeout{++++++++++++++++++++++++++++++++++++++++}
\typeout{\bioengName\space\bioengVers:\space\bioengTitl}
\typeout{++++++++++++++++++++++++++++++++++++++++}


%
% Class options
%
\LoadClass[a4paper,10pt,twocolumn,twoside]{article} % <= Abs guidelines
\DeclareOption{onecolumn}{\OptionNotUsed} % <= Abs guidelines
\DeclareOption{nopagenum}{\pagenumbering{gobble}}
% Options unknown to this class will be passed to the article class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%
% Font sizes
%
% 1pt == 1/72.00 inch in desktop publishing typesets
% 1pt == 1/72.27 inch in TeX
%
% Leading, in its modern term, refers to the distance between
% the baselines of successive lines of type.
%
\RequirePackage{anyfontsize} % Font size scaler for Computer Modern
\newcommand\titlFontSize{14pt} % <= Abs guidelines
\newcommand\titlFontLeading{18pt}
\newcommand\subtitlFontSize{12pt} % <= Abs guidelines
\newcommand\subtitlFontLeading{16pt}
\newcommand\subtitlAuthSep{0pt}
\newcommand\authFontSize{10pt} % <= Abs guidelines
\newcommand\authFontLeading{16pt}
\newcommand\mainFontSize{10pt} % <= Abs guidelines
\newcommand\mainFontLeading{16pt}


% 
% Redefine the maketitle command
%
\renewcommand\maketitle{%
  \begin{center}
    \fontsize{\titlFontSize}{\titlFontLeading}\selectfont
    \@title
  \end{center}
  \vspace{\subtitlAuthSep}
  \begin{flushright}
    \fontsize{\authFontSize}{\authFontLeading}\selectfont
    \@author
  \end{flushright}\par
}


%
% Redefine the abstract environment
%
\renewenvironment{abstract}{%
  {\noindent\bfseries\abstractname:}
  \noindent\ignorespaces
}{\vspace{\mainFontLeading}}


%
% Page margins
%
\RequirePackage[%
%  showframe,
  margin=25mm,
  twocolumn,
  twoside,
]{geometry}


%
% Section and subsection format settigns using
% the titlesec package ($ texdoc titlesec, p. 4)
%
\RequirePackage{titlesec}
%
% \titleformat
%   {<command>}
%   [<shape>]
%   {<format>}
%   {<label>}{<sep>}
%   {<before-code>}[<after-code>]
%
% {<command>}
% Sectioning command to be redefined
% e.g. \part, \chapter, \section
%
% [<shape>] Optional
% [block], [display], [frame], etc
%
% {<format>}
% Format to be applied to the whole title: label and text.
%
% {<label>}
% Although possible, inputing an empty value to this arg
% does not suppress the number in the table of contents
% and running heads.
%
% {<sep>}
% Horizontal sep between a label and the title body.
% The arg must be a length, not even empty.
% The sep is vertical space in display shape, and
% the distance from text to frame in frame.
% -> e.g. {1em}
% -> Use {0cm} if {<label>} is empty in section
% -> Use {0.25cm} if {<label>} is empty subsection
%
% {<before-code>}
% Words followed by the title body
%
% [<after-code>] Optional
% Words following the title body
%
\newcommand\horiSep{0.5em}
\titleformat
  {\section}
%  [display]
  {%
    \bfseries%
    \fontsize{\mainFontSize}{\mainFontLeading}\selectfont%
  }
  {\thesection.}{\horiSep} % A dot (.) follows the section label
  {}[]
\titleformat
  {\subsection}
%  [display]
  {%
    \bfseries%
    \fontsize{\mainFontSize}{\mainFontLeading}\selectfont%
  }%
  {\thesubsection.}{\horiSep} % A dot (.) follows the subsection label
  {}[]
%
% \titlespacing
%   {<command>}{<left>}
%   {<before-sep>}{<after-sep>}
%   [<right-sep>]
% The starred version (\titlespacing*) kills the indentation
% of the paragraph following the title ($ texdoc titlesec, p. 4).
%
% {<command>}
% Sectioning command to be redefined
% e.g. \part, \chapter, \section
%
% {<left>}
% Increases the left margin.
%
% {<before-sep>}
% Vertical space before the title
%
% {<after-sep>}
% Separation between title and text
%
% [<right-sep>] Optional
% The hang, block and display shapes have the possibility
% of increasing the hright-sepi margin with this optional
% argument.
%
\newcommand\leftMargin{0pt}
\newcommand\spaceBefSecTitle{1.0em}
\newcommand\spaceAftSecTitle{0.2em}
\titlespacing*
  {\section}{\leftMargin}
  {\spaceBefSecTitle}{\spaceAftSecTitle}
\titlespacing*
  {\subsection}{\leftMargin}
  {\spaceBefSecTitle}{\spaceAftSecTitle}


%
% Inline floats
%
\RequirePackage{wrapfig}
\setlength\intextsep{0cm} % Top and bottom margins of a float


%
% Captions
%
\RequirePackage{caption} % $ texdoc caption
\captionsetup[figure]{   % p. 4
  name=Fig.,             % pp. 15-16; the float label
  labelsep=period,       % p. 6; what follows the count of a float label
  textformat=simple,     % p. 7; what follows the last char of the caption
  font=normalsize,       % p. 9
}
\captionsetup[table]{
  name=Table,
  labelsep=period,
  textformat=simple,
  font=normalsize,
}
%eof