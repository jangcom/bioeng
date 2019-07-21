\newcommand{\bioengName}{bioeng}
\newcommand{\bioengTitl}{A LaTeX2e class for UTokyo Bioeng. defense abstract}
\newcommand{\bioengVers}{1.01}
\newcommand{\bioengDateLast}{2019/06/23}
\newcommand{\bioengDateFirst}{2018/06/19}
\newcommand{\bioengAuth}{Jaewoong Jang}
\newcommand{\bioengPosi}{PhD student}
\newcommand{\bioengAffi}{University of Tokyo}
\newcommand{\bioengMail}{jangj@korea.ac.kr}
\newcommand{\bioengLicOne}{Copyright (c) 2018-2019 \bioengAuth\space<\bioengMail>}
\newcommand{\bioengLicTwo}{This class is available under the MIT license;}
\newcommand{\bioengLicThree}{the license information is found in '\bioengName-LICENSE'.}
\typeout{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
\typeout{\bioengName\space\bioengVers:\space\bioengExpl}
\typeout{\bioengLicOne}
\typeout{\bioengLicTwo}
\typeout{\bioengLicThree}
\typeout{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}


%
% Font sizes
%
% 1pt == 1/72.00 inch in desktop publishing typesets
% 1pt == 1/72.27 inch in TeX
%
% Leading, in its modern term, refers to the distance between
% the baselines of successive lines of type.
%
\newcommand{\titlFontSize}{14pt}% <= Abs guidelines
\newcommand{\titlFontLeading}{18pt}
\newcommand{\subtitlFontSize}{12pt}% <= Abs guidelines
\newcommand{\subtitlFontLeading}{16pt}
\newcommand{\subtitlAuthSep}{0pt}
\newcommand{\authFontSize}{10pt}% <= Abs guidelines
\newcommand{\authFontLeading}{16pt}
\newcommand{\mainFontSize}{10pt}% <= Abs guidelines
\newcommand{\mainFontLeading}{16pt}


%
% Class definition
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\bioengName}[\bioengDateLast{\space}v\bioengVers]
\DeclareOption{onecolumnabs}{
  \renewcommand{\authFontSize}{12pt}
  \renewcommand{\authFontLeading}{16pt}
  \renewcommand{\mainFontSize}{11pt}
  \renewcommand{\mainFontLeading}{16pt}
}
\DeclareOption{nopagenum}{\pagenumbering{gobble}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,twocolumn,twoside]{article}% <= Abs guidelines


%
% Packages used throughout this class
%
\RequirePackage{anyfontsize}


% 
% Redefine the maketitle command.
%
\renewcommand{\maketitle}{%
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
% Redefine the abstract environment.
%
\renewenvironment{abstract}
  {\noindent\bfseries\abstractname:\noindent\ignorespaces}
  {\vspace{\mainFontLeading}}


%
% Page margins
%
\RequirePackage[
  margin=25mm,
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
\newcommand{\horiSep}{0.5em}
\titleformat
  {\section}
  {\bfseries
   \fontsize{\mainFontSize}{\mainFontLeading}\selectfont}
  {\thesection.}{\horiSep} % A dot (.) follows the section label
  {}[]
\titleformat
  {\subsection}
  {\bfseries
   \fontsize{\mainFontSize}{\mainFontLeading}\selectfont}
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
\newcommand{\leftMargin}{0pt}
\newcommand{\spaceBefSecTitle}{1.0em}
\newcommand{\spaceAftSecTitle}{0.2em}
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
\RequirePackage{caption}
\captionsetup[figure]{ % man p4
  name=Fig.,           % man pp15-16; the float label
  labelsep=period,     % man p6; what follows the count of a float label
  textformat=simple,   % man p7; what follows the last char of the caption
  font=normalsize,     % man p9
}
\captionsetup[table]{
  name=Table,
  labelsep=period,
  textformat=simple,
  font=normalsize,
}
%eof