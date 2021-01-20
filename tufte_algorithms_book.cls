\ProvidesClass{tufte_algorithms_book}
\RequirePackage{luatex85}

\LoadClass[justified,nobib,titlepage]{tufte-book}
% fullbook option
\newif\if@fullbook\@fullbookfalse
\DeclareOption{fullbook}{
	\@fullbooktrue
}
% solutionappendix
\newif\if@solutionappendix\@solutionappendixfalse
\DeclareOption{solutionappendix}{
	\@solutionappendixtrue
}
\ProcessOptions\relax

\usepackage[toc,page,title,titletoc]{appendix}

\expandafter\def\csname PY@tok@err\endcsname{}

\geometry{
	paperheight=9in,
	top=3pc,
	bottom=6pc,
	paperwidth=8in,
	inner=3pc,
	outer=3pc,
	marginparsep=1pc,
	marginparwidth=10pc,
	includehead,
	bindingoffset=2pc,
	includemp
}

\usepackage{titlecaps}
\usepackage{suffix}
\Addlcwords{et de la le a an the at is by for in of on to up and as but it or nor all with for from to about across against along among before below given into like near next off on out over past per round than toward unlike until unto upon via within}

\usepackage[american]{babel} % to fix http://tex.stackexchange.com/questions/315532/bblmainlanguage-error-in-biblatex
\usepackage{fontspec}
\usepackage{realscripts}
\usepackage{amsmath,bm,amssymb}
\usepackage{amsthm}
\usepackage{bbm}
\usepackage[makeroom]{cancel}
\usepackage{booktabs}
\setfloatalignment{t}
\usepackage{comment}
\usepackage{tikz}
\usepackage{xfrac}
\usepackage{datetime2}
\usepackage[group-digits=integer,group-minimum-digits=4,group-separator={,},detect-all]{siunitx}
\usepackage{vector} % package included in this directory
\usepackage[noend]{algpseudocode}
\usepackage{textpos}
\usepackage{enumitem}
\newcommand{\bulletdescriptionlabel}[1]{\itshape #1.~}
\setlist[description]{before=\let\makelabel\bulletdescriptionlabel}

\setmonofont{DejaVu Sans Mono}[Scale=MatchLowercase]
\usepackage{newunicodechar}
\newfontface{\calligraphic}{Latin Modern Math}[Scale=0.85]
\newunicodechar{𝒪}{{\normalfont\calligraphic 𝒪}}
\newunicodechar{ℬ}{{\normalfont\calligraphic ℬ}}
\newunicodechar{𝒜}{{\normalfont\calligraphic 𝒜}}
\newunicodechar{𝒮}{{\normalfont\calligraphic 𝒮}}

\usetikzlibrary{calc}
\usetikzlibrary{fit}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{decorations.text}
\usetikzlibrary{patterns}
\usetikzlibrary{graphs}
\usetikzlibrary{graphdrawing}
\usetikzlibrary{shapes}

\usepackage[pgfplots]{juliaplots.sty/juliaplots}
\setpythontexpygopt{style=algforopt}
\pgfplotsset{compat=newest}
\pgfplotsset{every axis legend/.append style={legend cell align=left, font=\footnotesize, draw=none, fill=none}}
\pgfplotsset{every axis/.append style={axis background/.style={fill=white}}}
\pgfplotsset{every tick label/.append style={font=\footnotesize}}
\pgfplotsset{every axis label/.append style={font=\footnotesize}}

\usepackage{microtype}

\fvset{baselinestretch=0.8}
\usepgfplotslibrary{fillbetween}
\usepgfplotslibrary{groupplots}
\usepgfplotslibrary{patchplots}
\usepgfplotslibrary{statistics}
\usepgfplotslibrary{ternary}

\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{1}
\newfontfeature{Microtype}{protrusion=default;expansion=default;}

\renewcommand\allcapsspacing[1]{{\addfontfeature{LetterSpace=15}#1}}
\renewcommand\smallcapsspacing[1]{{\addfontfeature{LetterSpace=10}#1}}

\newcommand{\todo}[1]{\textbf{\textcolor{magenta}{#1}}}
\newcommand{\needcite}{\todo{cite}}

\newcommand{\siyear}[1]{\num[group-minimum-digits=999]{#1}}
\newcommand{\siyearrange}[2]{\siyear{#1}--\siyear{#2}}

% INDEX
\if@fullbook
\usepackage[xindy]{imakeidx}
\makeindex[options=-M cms]
\newcommand{\vocab}[1]{\index{#1}\emph{#1}}
\newcommand{\vocabalt}[2]{\index{#2}\emph{#1}}
\excludecomment{inprogress}
\excludecomment{chapteronly}
\newenvironment{bookonly}{}{}
\newcommand{\chref}[2]{\cref{#2}}
\newcommand{\Chref}[2]{\Cref{#2}}
\else
\newcommand{\vocab}[1]{\textit{#1}}
\newcommand{\vocabalt}[2]{\textit{#1}}
\newenvironment{inprogress}{}{}
\newenvironment{chapteronly}{}{}
\excludecomment{bookonly}
\newcommand{\chref}[2]{#1}
\newcommand{\Chref}[2]{#1}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH

\newcommand{\dset}{\mathcal{D}}
\newcommand{\params}{\vect \theta}

\newcommand{\true}{\text{true}}
\newcommand{\false}{\text{false}}
\newcommand{\transpose}{\top}

\newcommand{\noisy}[1]{\tilde{#1}}

\newcommand{\mat}[1]{\vect{#1}}

\usepackage{mathtools}
\DeclarePairedDelimiter{\paren}{\lparen}{\rparen}
\DeclarePairedDelimiter{\brock}{\lbrack}{\rbrack}
\DeclarePairedDelimiter{\curly}{\{}{\}}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\anglebrackets}{\langle}{\rangle}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\card}{|}{|}

\newcommand{\minimize}{\operatornamewithlimits{minimize}}
\newcommand{\maximize}{\operatornamewithlimits{maximize}}
\newcommand{\supremum}{\operatornamewithlimits{supremum}}
\newcommand{\argmin}{\operatornamewithlimits{arg\,min}}
\newcommand{\argmax}{\operatornamewithlimits{arg\,max}}
\newcommand{\subjectto}{\operatorname{subject~to}}
\newcommand{\for}{\text{for} \;}
\newcommand{\gaussian}[2]{\mathcal{N}(#1, #2)}
\newcommand{\Gaussian}[2]{\mathcal{N}\paren*{#1, #2}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\DeclareMathOperator{\sign}{sign}
\DeclareMathOperator{\Real}{\text{Re}}
\DeclareMathOperator{\Imag}{\text{Im}}
\DeclareMathOperator{\nil}{\textsc{nil}}
\DeclareMathOperator{\Expectation}{\mathbb{E}}
\DeclareMathOperator{\Variance}{\mathrm{Var}}
\DeclareMathOperator{\Normal}{\mathcal{N}}
\DeclareMathOperator{\Uniform}{\mathcal{U}}
\DeclareMathOperator{\Dirichlet}{Dir}
\DeclareMathOperator{\atantwo}{atan2}
\DeclareMathOperator{\modOne}{mod_1}
\DeclareMathOperator{\trace}{Tr}
\newcommand{\minprob}[3]{
\begin{aligned}
	\minimize_{#1} & & #2\\
	\subjectto & & #3 \\
\end{aligned}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STYLE

\tikzstyle{node}=[circle,draw=black,minimum width=0.8cm]
\tikzstyle{large node}=[node,minimum width=1.1cm]
\tikzstyle{highlight node}=[circle,draw=black,fill=gray!50,minimum width=0.8cm]
\tikzstyle{large highlight node}=[circle,draw=black,fill=gray!50,minimum width=1.1cm]
\tikzstyle{highlight2 node}=[circle,draw=black,fill=gray!20,minimum width=0.8cm]
\tikzstyle{plate} = [draw,thick,inner sep=0.25cm,rounded corners,gray]

\tikzstyle{decision node}=[rectangle,draw=black,minimum width=0.7cm,minimum height=0.7cm]
\tikzstyle{utility node}=[shape=diamond,minimum width=1cm, minimum height=1cm,draw=black]


\definecolor{pastelMagenta}{HTML}{FF48CF}
\definecolor{pastelPurple}{HTML}{8770FE}
\definecolor{pastelBlue}{HTML}{1BA1EA}
\definecolor{pastelSeaGreen}{HTML}{14B57F}
\definecolor{pastelGreen}{HTML}{3EAA0D}
\definecolor{pastelOrange}{HTML}{C38D09}
\definecolor{pastelRed}{HTML}{F5615C}

\newcommand{\colorpt}[1]{%
	\pgfplotscolormapaccess[0:100]{#1}{pasteljet}
    \def\TEMP{\definecolor{my color}{rgb}}
    \expandafter\TEMP\expandafter{\pgfmathresult}
}

\begin{jlcode}
	using Colors
	using ColorSchemes
	pasteljet = ColorMaps.RGBArrayMap(ColorSchemes.viridis, interpolation_levels=500, invert=true);
    pastelRedBlue = ColorMaps.RGBArrayMap([RGB(246/255, 21/255, 92/255),
    									   RGB(1.0,1.0,1.0),
					    	    	   	   RGB( 27/255,161/255,234/255)], interpolation_levels=500);
\end{jlcode}

\input{colors.tex}

\pgfplotscreateplotcyclelist{pastelcolors}{%
	solid, pastelPurple, mark=none\\%
	solid, pastelBlue, mark=none\\%
	solid, pastelGreen, mark=none\\%
	solid, pastelRed, mark=none\\%
	solid, pastelMagenta, mark=none\\%
	solid, pastelOrange, mark=none\\%
	solid, pastelSeaGreen, mark=none\\%
}

\tikzstyle{solid_line}=[solid, thick, mark=none]
\tikzset{every picture/.style={semithick, >=stealth'}}
\tikzset{myline/.style={line width = 0.05cm, rounded corners=5mm}}
\tikzset{myarrow/.style={line width = 0.05cm, ->, rounded corners=5mm}}
\tikzset{myaxis/.style={thick, ->, line cap=rect}}
\tikzset{roundednode/.style={rounded corners=4mm,draw=black,fill=white,line width=0.05cm, minimum size=0.35in, align=center}}

% USAGE: \jlpkg{DualNumbers} -> DualNumbers.jl
\newcommand{\jlpkg}[1]{\texttt{#1.jl}}

% Specify hyphenation.
\hyphenation{Lip-schitzian}
\hyphenation{multi-objective}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\IfFileExists{./vc.tex}{
\input{vc}
\newcommand{\bookfoot}{\footnotesize \DTMnow, revision \GITAbrHash, \smallcaps{draft: send comments to bugs@algorithmsbook.com}}
}{
\newcommand{\bookfoot}{\footnotesize \DTMnow, \smallcaps{draft: send comments to bugs@algorithmsbook.com}}
}

% \renewcommand{\bookfoot}{} % remove footer

% remove empty lines from juliaconsole
% from: https://github.com/gpoore/pythontex/issues/98#issuecomment-318078264
\makeatletter
\AtBeginEnvironment{juliaconsole}{%
	\def\FV@@PreProcessLine{%
		\expandafter\ifstrempty\expandafter{\FV@Line}{}{%
			\FV@StepLineNo
			\FV@Gobble
			\expandafter\FV@ProcessLine\expandafter{\FV@Line}}}%
}
\makeatother

\makeatletter
\RequirePackage{multicol}
\renewenvironment{theindex}{%
	\chapter*{\indexname}%
	\begin{fullwidth}%
		\small%
		\parskip0pt%
		\parindent0pt%
		\let\item\@idxitem%
		\begin{multicols}{3}%
		}{%
		\end{multicols}%
	\end{fullwidth}%
}
\renewcommand\@idxitem{\par\hangindent 2em}
\renewcommand\subitem{\par\hangindent 3em\hspace*{1em}}
\renewcommand\subsubitem{\par\hangindent 4em\hspace*{2em}}
\renewcommand\indexspace{\par\addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}\relax}%
\renewcommand{\lettergroup}[1]{}% swallow the letter heading in the index
\newcommand{\forceheader}[1]{
	\fancyhf{}%
	\fancyhead[LE]{\thepage\quad\smallcaps{#1}}
	\fancyhead[RO]{\smallcaps{#1}\quad\thepage}
	\fancyfoot[LE]{\bookfoot}
	\fancyfoot[RO]{\bookfoot}
}
\renewcommand\frontmatter{%
	\cleardoublepage%
	\@mainmatterfalse%
	\fancyhf{}%
%	\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
%	\renewcommand{\sectionmark}[1]{\markright{##1}}
%	\fancyhead[LE]{\thepage\quad\smallcaps{\leftmark}}
%	\fancyhead[RO]{\smallcaps{\rightmark}\quad\thepage}
	\fancyfoot[LE]{\bookfoot}
	\fancyfoot[RO]{\bookfoot}
	\pagenumbering{roman}
}
\renewcommand\mainmatter{%
	\cleardoublepage%
	\@mainmattertrue%
	\fancyhf{}%
	\renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter.\ ##1}{}}
	\renewcommand{\sectionmark}[1]{\markright{\thesection.\ ##1}}
	\fancyhead[LE]{\thepage\quad\smallcaps{\leftmark}}
	\fancyhead[RO]{\smallcaps{\rightmark}\quad\thepage}
	\fancyfoot[LE]{\bookfoot}
	\fancyfoot[RO]{\bookfoot}
	\pagenumbering{arabic}
}
\renewcommand\backmatter{%
	\cleardoublepage%
	\@mainmatterfalse%
	\fancyhf{}%
%	\renewcommand{\chaptermark}[1]{\markboth{##1}{##1}}
%	\renewcommand{\sectionmark}[1]{}
%	\renewcommand{\chaptermark*}[1]{\markboth{##1}{}}
%	\renewcommand{\sectionmark*}[1]{\markright{##1}}
%	\fancyhead[LE]{\thepage\quad\smallcaps{\leftmark}}
%	\fancyhead[RO]{\smallcaps{\rightmark}\quad\thepage}
	\fancyfoot[LE]{\bookfoot}
	\fancyfoot[RO]{\bookfoot}
}
\makeatother

% Handle the Example and Algorithm floats
\usepackage{mdframed}
\definecolor{shadecolor}{rgb}{1,0.8,0.3}
\newcounter{example}[chapter]
\newcommand\examplename{Example}
\newcommand\listexamplename{List of Examples}
\makeatletter
\newcommand\listofexamples{%
	\ifthenelse{\equal{\@tufte@class}{book}}%
	{\chapter*{\listexamplename}}%
	{\section*{\listexamplename}}%
	%  \begin{fullwidth}%
	\@starttoc{loe}%
	%  \end{fullwidth}%
}
\renewcommand\theexample
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@example}
\def\fps@example{tbp}
\def\ftype@example{1}
\def\ext@example{loe}
\def\fnum@example{\examplename\nobreakspace\theexample}
\newenvironment{example}[1][htbp]
{\begin{@tufte@float}[#1]{example}{}
		\begin{mdframed}[backgroundcolor=black!5,rightline=false,leftline=false]\setlength{\parindent}{1.0pc}\ignorespaces}
		{\end{mdframed}\end{@tufte@float}}
\makeatother
\newcounter{algorithm}[chapter]
\newcommand\algorithmname{Algorithm}
\newcommand\listalgorithmname{List of Algorithms}
\makeatletter
\newcommand\listofalgorithms{%
	\ifthenelse{\equal{\@tufte@class}{book}}%
	{\chapter*{\listalgorithmname}}%
	{\section*{\listalgorithmname}}%
	%  \begin{fullwidth}%
	\@starttoc{loa}%
	%  \end{fullwidth}%
}
\renewcommand\thealgorithm
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@algorithm}
\def\fps@algorithm{tbp}
\def\ftype@algorithm{1}
\def\ext@algorithm{loa}
\def\fnum@algorithm{\algorithmname\nobreakspace\thealgorithm}
\newenvironment{algorithm}[1][htbp]
{\begin{@tufte@float}[#1]{algorithm}{}
		\begin{mdframed}[backgroundcolor=black!5,rightline=false,leftline=false]}
		{\end{mdframed}\end{@tufte@float}}
\makeatother

% The following code block controls how parts, chapters, and sections are displayed.
% The titleformat blocks control how they look when typeset in the main book,
% whereas the titlecontents blocks control how they look in the table of contents.
% For a decent reference, see https://github.com/Tufte-LaTeX/tufte-latex/blob/efb8c8e836890bad71fb5834acdd316ebde6db12/tufte-common.def
% NOTE(Tim, 20210116): I am fudging the vertical space by adding \vspace commands to get the effect I want.
%                      Ideally we would not do this.
% NOTE(Tim, 20210119): The appendixpart is included as an alternative for part that just rendered "APPENDIX".
%                      Without this, we would get "PART APPENDIX".
\makeatletter

\titleclass{\part}{top}
\titleformat{\part}%
[display]% shape
{}% format applied to label+text
{\huge\smallcaps{Part~\thepart:}}% label
{1em}% horizontal separation between label and title body
{\huge\rmfamily\smallcaps}% before the title body

\titleformat{\chapter}%
[hang]% shape
{}% format applied to label+text
	{\itshape\huge\thechapter}% label
	{1em}% horizontal separation between label and title body
	{\huge\rmfamily\itshape}% before the title body

\ifthenelse{\boolean{@tufte@toc}}{%
	\titlecontents{part}%
	[0em] % distance from left margin
	{\vspace{0.5em}\vspace{\baselineskip}\begin{fullwidth}\LARGE\rmfamily\scshape\addfontfeature{LetterSpace=10}} % above (global formatting of entry)
		{\hspace*{0em}\contentslabel{0em}\hspace*{0.5in}} % before w/label (label = ``2'')
		{\hspace*{0em}part\hspace*{0.5em}\contentslabel{0em}\lowercase} % before w/o label
		{} % filler + page (leaders and page num)
		[\end{fullwidth}\vspace*{-1em}] % after
	\titlecontents{appendixpart}%
	[0em] % distance from left margin
	{\vspace{0.5em}\vspace{\baselineskip}\begin{fullwidth}\LARGE\rmfamily\scshape\addfontfeature{LetterSpace=10}} % above (global formatting of entry)
		{\hspace*{0em}\contentslabel{0em}\hspace*{0.5in}} % before w/label (label = ``2'')
		{\hspace*{0em}\contentslabel{0em}\lowercase} % before w/o label
		{} % filler + page (leaders and page num)
		[\end{fullwidth}\vspace*{-1em}] % after
	\titlecontents{chapter}%
	[0em] % distance from left margin
	{\vspace{\baselineskip}\begin{fullwidth}\normalsize\rmfamily\itshape} % above (global formatting of entry)
		{\hspace*{0em}\contentslabel{0em}\hspace*{0.25in}} % before w/label (label = ``2'')
		{\hspace*{0em}} % before w/o label
		{\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
		[\end{fullwidth}\vspace*{-1.5em}] % after
	\titlecontents{section}%
	[0em] % distance from left margin
	{\vspace{\baselineskip}\begin{fullwidth}\small\rmfamily} % above (global formatting of entry)
		{\hspace*{0.3in}\contentslabel{0em}\hspace*{0.5in}} % before w/label (label = ``2'')
		{\hspace*{0em}} % before w/o label
		{\rmfamily\qquad\thecontentspage} % filler + page (leaders and page num)
		[\end{fullwidth}\vspace*{-1.5em}] % after
}{}
\makeatother


\usepackage[style=ieee,backend=biber,mincitenames=1,doi=false,url=false,isbn=false,backref=true]{biblatex}
\input{references}

\usepackage[noabbrev]{cleveref}
\crefname{algorithm}{algorithm}{algorithms}

\theoremstyle{definition}
\newtheorem{thm}{Theorem}[chapter]
\newtheorem{question}[thm]{Exercise}
\newenvironment{solution}{\noindent\textit{Solution:}}{}
\excludecomment{ignore}
\excludecomment{juliatest}
% UNCOMMENT THE NEXT LINE TO DISABLE SOLUTIONS
%\excludecomment{solution}


\makeatletter
\if@solutionappendix
\newcommand{\solutions}{\include{chapter/solutions}}
\excludecomment{solution}
\else
\newcommand{\solutions}{}
\fi
\makeatother

% Change Figure X: to Figure X.
\makeatletter
\long\def\@caption#1[#2]#3{%
	\par%
	\addcontentsline{\csname ext@#1\endcsname}{#1}%
	{\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
	\begingroup%
	\@parboxrestore%
	\if@minipage%
	\@setminipage%
	\fi%
	\@tufte@caption@font\@tufte@caption@justification%
	\noindent\csname fnum@#1\endcsname. \ignorespaces#3\par%
	%\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
	\endgroup}
\makeatother

% from: https://tex.stackexchange.com/questions/453132/fresh-install-of-tl2018-no-tikz-graph-drawing-libraries-found
\usepackage{luacode}
\begin{luacode*}
	function pgf_lookup_and_require(name)
	local sep = package.config:sub(1,1)
	local function lookup(name)
	local sub = name:gsub('%.',sep)
	if kpse.find_file(sub, 'lua') then
	require(name)
	elseif kpse.find_file(sub, 'clua') then
	collectgarbage('stop')
	require(name)
	collectgarbage('restart')
	else
	return false
	end
	return true
	end
	return
	lookup('pgf.gd.' .. name .. '.library') or
	lookup('pgf.gd.' .. name) or
	lookup(name .. '.library') or
	lookup(name)
	end
\end{luacode*}
\usegdlibrary{layered}
\usegdlibrary{trees}
