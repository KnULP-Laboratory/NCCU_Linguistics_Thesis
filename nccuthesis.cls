% author: Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan]

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nccuthesis}[2022/06/23 Thesis template for National Chengchi University]

% Derived from book class
\DeclareRobustCommand{\type}[2]{\gdef\@typeen{#1}\gdef\@typezh{#2}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}

\def\@doubleline{2}
\def\@onehalfline{1.5}
\DeclareRobustCommand{\@setspacing}{\setstretch{\@onehalfline}}
\newif\ifzh
\zhfalse
\DeclareOption{zh}{\gdef\@setspacing{\setstretch{\@onehalfline}}\zhtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{book}

% Required packages
\RequirePackage[top=2.54cm,left=3.81cm,bottom=2.54cm,right=2.54cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[titles]{tocloft} % for centering title
\RequirePackage{titlesec} % for formatting title
\RequirePackage{titletoc} % for formatting toc
\RequirePackage{etoolbox} % for patchcmd
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{caption}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}

\abstractname{Abstract}{摘要}
\acknowledgements{Acknowledgements}{誌謝}

\DeclareRobustCommand{\clearpages}{\if@openright\cleardoublepage\else\clearpage\fi}


\DeclareRobustCommand{\makecover}{
  \begin{titlepage}
    \vspace{3.5cm}
    \begin{center}
      \Large{\@universityzh\@institutezh\@typezh}\\[28pt]
      \Large{\@universityen}\\
      \Large{\@instituteen}\\
      \Large{\@typeen}\\[28pt]
      \Large{指導教授：\@advisorzh}\\
      \Large{Advisor: Dr.\ \@advisoren}\\
      \vspace*{\fill}
      \Large{\@titlezh}\\
      \Large{\@titleen}\\
      \vspace*{\fill}
      \Large{研究生：\@authorzh 撰}\\
      \Large{Student: \@authoren}\\
      \Large{中華民國 \@yearzh 年 \@monthzh 月}\\
      \Large{\@monthen, \@yearen}\\
    \end{center}
  \end{titlepage}
}






\newenvironment{quotationpage}[1]
  {\clearpages
   \chapter*{\centerline{#1}}
   \addcontentsline{toc}{chapter}{#1}
   \quotation}
   {\endquotation}

\newenvironment{abstracten}{\begin{quotationpage}{\@abstractnameen}\begin{spacing}{\@doubleline}}{\end{spacing}\end{quotationpage}}
\newenvironment{abstractzh}{\begin{quotationpage}{\@abstractnamezh}\begin{spacing}{\@onehalfline}}{\end{spacing}\end{quotationpage}}
\newenvironment{copyrighten}{\begin{quotationpage}\vspace*{\fill}\end{quotationpage}}

\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}\begin{spacing}{\@doubleline}}{\end{spacing}\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}\begin{spacing}{\@onehalfline}}{\end{spacing}\end{quotationpage}}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\@setspacing



% ToC, LoF, LoT centering settings with package tocloft
\renewcommand{\cftloftitlefont}{\hfill \fontsize{12pt}{15pt}\selectfont \bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cfttoctitlefont}{\hfil \fontsize{12pt}{15pt}\selectfont \bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \fontsize{12pt}{15pt}\selectfont \bfseries}
\renewcommand{\cftafterlottitle}{\hfill}

\renewcommand\contentsname{\large \centerline{Table of Contents}}
\renewcommand\listfigurename{\large List of Figures}
\renewcommand\listtablename{\large List of Tables}

%caption adjustment
\captionsetup[figure]{format=plain, justification=justified, labelfont={bf, doublespacing}, textfont={doublespacing}, name={Figure},labelsep=space}
\captionsetup[table]{format=plain, justification=justified, labelfont={bf, doublespacing}, textfont={doublespacing}, name={Table},labelsep=space}

% Set Reference Name

\renewcommand\bibname{Reference}


\titlespacing{\chapter}{0cm}{0cm}{21pt}
\titleformat{\chapter}[hang]{\fontsize{18pt}{0pt}\selectfont \centering \bfseries}{Chapter \thechapter.}{1em}{}
\titleformat{\section}[hang]{\fontsize{16pt}{0pt}\selectfont}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\fontsize{14pt}{0pt}\selectfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\fontsize{14pt}{0pt}\selectfont}{\thesubsubsection}{1em}{}



\renewcommand{\cftchapfont}{\normalfont\bfseries}% titles in bold
\renewcommand{\cftchappagefont}{\normalfont\bfseries}% page numbers in bold
\renewcommand{\cftdotsep}{1}
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftsecdotsep}}% dot leaders in bold




\makeatletter
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}
\patchcmd{\@chapter}{\addtocontents{toc}{\protect\addvspace{5\p@}}}{}{}{}
\makeatother


% value > 0
\def\xeCJKembold{0.4}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}
\newcommand\zhbf[1]{\CJKfakebold{#1}}

% set Chinese version
\ifzh

  % set two-character indentation
  \setlength{\parindent}{2em}

  % Very Naive Chinese Number
  \DeclareRobustCommand{\naiveZhNum}[1]{
  \ifnum #1 = 1
  一
  \else \ifnum #1 = 2
  二
  \else \ifnum #1 = 3
  三
  \else \ifnum #1 = 4
  四
  \else \ifnum #1 = 5
  五
  \else \ifnum #1 = 6
  六
  \else \ifnum #1 = 7
  七
  \else \ifnum #1 = 8
  八
  \else \ifnum #1 = 9
  九
  \else
  #1
  \fi\fi\fi\fi\fi\fi\fi\fi\fi
  }

  \titleformat{\chapter}{\centering\fontsize{18pt}{0pt}\bfseries}{第\naiveZhNum{\thechapter}章}{1em}{}
  \titlecontents{chapter}[0em]{}{\makebox[4.1em][l]{第\naiveZhNum{\thecontentslabel}章}}{}{\cftdotfill{\cftdotsep}\contentspage}
  
  \titleformat{\section}{\centering\fontsize{16pt}{0pt}\bfseries}{第\naiveZhNum{\thechapter}節}{1em}{}
  \titlecontents{section}[0em]{}{\makebox[4.1em][l]{第\naiveZhNum{\thecontentslabel}節}}{}{\cftdotfill{\cftdotsep}\contentspage}
  
  \titleformat{\subsection}{\fontsize{14pt}{0pt}\bfseries}{\naiveZhNum{\thechapter}、}{1em}{}
  \titlecontents{section}[0em]{}{\makebox[4.1em][l]{\naiveZhNum{\thesubsection}、}{}{\cftdotfill{\cftdotsep}\contentspage}

  \floatname{algorithm}{演算法}
  \renewcommand{\algorithmicrequire}{\textbf{輸入：}}
  \renewcommand{\algorithmicensure}{\textbf{輸出：}}


  \renewcommand{\contentsname}{目錄}
  \renewcommand{\listfigurename}{圖目錄}
  \renewcommand{\listtablename}{表目錄}
  \renewcommand{\tablename}{表}
  \renewcommand{\figurename}{圖}
  \renewcommand{\bibname}{參考文獻}

  \DeclareRobustCommand{\@startappendix}{
  \titleformat{\chapter}{\centering\Huge\bfseries}{附錄 \thechapter}{1em}{}
  \titlecontents{chapter}[0em]{}{\makebox[4.1em][l]{附錄 \thecontentslabel}}{}{\cftdotfill{\cftdotsep}\contentspage}
  \appendix}
\else
  \DeclareRobustCommand{\@startappendix}{\appendix}
\fi

