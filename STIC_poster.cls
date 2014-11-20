% Classe pour poster STIC version 2.0
% Développée par : Paul de Nazelle -- paul.denazelle@irt-systemx.fr
% 		    Timothée Leblond -- timothee.leblond@irt-systemx.fr

% sans option : \RequirePackage{SystemX}  
% avec option : \RequirePackage[r;v;b]{SystemX}						% choix de la couleur de la présentation

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{STIC_poster}[2014/09/09 Classe pour poster STIC, V2.0]

\LoadClass[french,final,12pt]{beamer}


% \def\@@formatcolor#1;#2;#3\@nil{#1,#2,#3}
% \DeclareOption*{\edef\tempa{\noexpand\definecolor{prescolor}{RGB}{\expandafter\@@formatcolor\CurrentOption\@nil}}\tempa}
% \ProcessOptions\relax

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Packages à utiliser 
\RequirePackage[orientation=portrait,size=a0,scale=1.4]{beamerposter}
\RequirePackage{tikz}
	\usetikzlibrary{calc, positioning} 
\RequirePackage{helvet}
	\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage{bold-extra}
\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8]{inputenc}
\RequirePackage[french]{babel}
\RequirePackage{amsmath}
\RequirePackage{microtype}
\RequirePackage{xargs}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition de quelques options 

% Dossier dans lequel se trouve les figures
\graphicspath{{Figures/}}
\setbeamertemplate{navigation symbols}{}

% Deuxième auteur de la présentation
\def\insertposternumber{}
\newcommand{\PosterNum}[1]{\def\insertposternumber{#1}}

% Définition d'une commande pour des commentaires dans le foot
\def\insertfootcomment{}
\newcommand{\footcomment}[1]{\def\insertfootcomment{#1}}

\mode<presentation>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition des couleurs
\definecolor{systemx}{RGB}{0,157,223} 						% Bleu systemx
\definecolor{prescolor}{RGB}{0,157,223} 						% Bleu de la présentation
\definecolor{systemxDark}{RGB}{0,104,141} 					% Bleu de la présentation
\definecolor{mongray}{RGB}{156,156,156}
\definecolor{monred}{rgb}{0.79 0.0 0.1}
\definecolor{monbleu}{rgb}{0.1 0.1 0.6}
% \definecolor{monbleu2}{rgb}{0.4,0.4,0.8}
\definecolor{monbleu2}{rgb}{0.6,0.6,1}
\definecolor{monvert}{rgb}{0.2,1,0.2}
\definecolor{monorange}{rgb}{1,0.8,0.2}
\definecolor{orangeSystemX}{RGB}{241,90,36}
\setbeamercolor*{structure}{fg=black!90}
\setbeamercolor*{palette primary}{fg=black!10,bg=prescolor!80}
\setbeamercolor*{palette secondary}{fg=black!10,bg=prescolor!75}
\setbeamercolor*{palette tertiary}{fg=black!10,bg=prescolor!70}
\setbeamercolor*{palette quaternary}{fg=black!10,bg=prescolor!65}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition des couleurs des blocs
\setbeamerfont*{block title}{size=\normalsize,family=\sffamily,shape=\scshape}%,series=\bfseries}	% définit la font des titres des blocks

\setbeamercolor*{block title}{fg=prescolor,bg=black!5}
\setbeamercolor*{block body}{fg=black,bg=black!5}

\setbeamercolor*{block title alerted}{fg=black,bg=prescolor!80}
\setbeamercolor*{block body alerted}{fg=black,bg=black!5}

\setbeamercolor*{block title example}{fg=black!10,bg=black!80}
\setbeamercolor*{block body example}{fg=black!10,bg=black!70}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition du Titre du poster
\setbeamerfont{myname}{size=\large,family=\sffamily,shape=\scshape,series=\mdseries}	% définit la font des titres de la diapositive générale
\setbeamerfont{mytitle}{size=\huge,family=\sffamily,shape=\scshape,series=\mdseries}	% définit la font des titres de la diapositive générale
\setbeamertemplate{headline}{  
	\leavevmode
	\vskip-7pt
	\begin{beamercolorbox}[wd=\paperwidth]{headline}
		\begin{tikzpicture}
			\node at(0,0) (head) {
				\hskip-6pt
				\includegraphics[height=5cm,width=\paperwidth]{Base/STIC_14_bandeau_haut}
			};
			\node[below=-16pt of head] (title) {
				\hskip-6pt
				\includegraphics[width=\paperwidth]{Base/STIC_14_bandeau_nom}
			};
			\node[below=1.2cm of head] {
				\begin{minipage}{.9\paperwidth}
					\centering
					\usebeamerfont{myname}{\textcolor{black}{\insertauthor}}
				\end{minipage}
			};
			\node[below of=title,text width=.05\paperwidth,xshift=-37cm,yshift=-0.9cm,text centered] (num) {
				\usebeamerfont{mytitle}{\textcolor{white}{
					n$^{\circ}\,\insertposternumber$
				}}
			};
			\node[below of=title,xshift=6cm,yshift=-1.5cm] (num) {
				\begin{minipage}{.88\paperwidth}
					\centering 
					\setlength\lineskip{1.5cm}
					\usebeamerfont{mytitle}{\textcolor{white}{
						\inserttitle
					}}
				\end{minipage}
			};
		\end{tikzpicture}
	\end{beamercolorbox}
% 	\vskip2cm
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamerfont*{myfootfont}{family=\sffamily,size=\small}							% font des pieds de page
\setbeamertemplate{footline}{
	\begin{beamercolorbox}[wd=\paperwidth]{upper separation line foot}
		\rule{0pt}{2pt}
	\end{beamercolorbox}
	\leavevmode%
	\begin{beamercolorbox}[wd=\paperwidth]{foot}%
		\begin{tikzpicture}
			\node at(0,0) (foot) {
				\hskip-6pt
				\includegraphics[width=\paperwidth]{Base/STIC_14_bandeau_bas}
			};
			\node[below of=foot,text width=.7\paperwidth,xshift=-8cm,yshift=0cm] {
				\usebeamerfont{myfootfont}{
					\insertfootcomment
				}
			};
		\end{tikzpicture}
	\end{beamercolorbox}%
	\vskip-9pt
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Création des barres d'avancement pour utilisation dans le poster
\newcommandx{\myprogressbar}[2][1=]{
	\tikz[#1]{
		\draw[line width=.5pt,color=systemx] (0,0) rectangle (6,.6);%
		\draw[line width=.5pt,color=systemx,fill=systemx] (0,0) rectangle (#2/100*6,.6);%
		\node[overlay] at(#2/100*6,0) (curs) {\textcolor{systemxDark}{$\blacktriangle$}};
		\node[overlay,below=-4pt of curs] {\scriptsize #2\%};
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition des symboles des listes
\RequirePackage{enumitem}
\setlist[itemize,1]{label={\tikz{\draw[fill=prescolor,color=orangeSystemX,rotate=45] (-0.2,-.2) rectangle (0.2,0.2);}},before*=\vspace{.2cm}\normalsize}
\setlist[itemize,2]{label={\tikz{\draw[fill=systemx,color=systemx,rotate=45] (-0.15,-0.15) rectangle (.15,.15);}},before*=\small}
\setlist[itemize,3]{label={\tikz{\draw[fill=mongray,color=mongray,rotate=45] (-0.1,-0.1) rectangle (.1,.1);}},before*=\footnotesize}
\setlist[itemize]{partopsep=.7cm,itemsep=0cm}

\newcommand{\Atext}[2]{
	\begin{center}
		\tikz{\node[top color=systemx!60,bottom color=systemx!20,fill=prescolor,text width=#2,scale=1,text centered] at(0,0) {\emph{#1}} ;}
	\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Définition de boites
\RequirePackage[]{tcolorbox}
\newenvironmentx{nbox}[2][1=\textwidth]
{
	\begin{center}
			\begin{tcolorbox}[colback=black!5,colframe=black!5,arc=2mm,coltitle= systemx,adjusted title=#2\vspace{10pt},fonttitle=\scshape,width = #1]
				\vspace{10pt}
				}
				{
			\end{tcolorbox}
	\end{center}
}

\newenvironmentx{abox}[2][1=\textwidth]
{
	\begin{center}
			\begin{tcolorbox}[colbacktitle=systemx,colback=black!5,colframe=white,arc=2mm,coltitle= black,adjusted title=#2\vspace{10pt},fonttitle=\scshape,width = #1]
				\vspace{10pt}
				}
				{
			\end{tcolorbox}
	\end{center}
}


\newenvironmentx{ebox}[2][1=\textwidth]
{
	\begin{center}
			\begin{tcolorbox}[coltitle= white,coltext = white, colback=black!70,colframe=black!80,arc=2mm,adjusted title=#2\vspace{10pt},fonttitle=\scshape,width = #1]
				\vspace{10pt}
				}
				{
			\end{tcolorbox}
	\end{center}
}

\newenvironmentx{sxbox}[2][1=\textwidth]
{
	\begin{center}
			\begin{tcolorbox}[colback=white,colframe=systemx,arc=2mm,fonttitle=\scshape,width = #1]
				\textcolor{systemx}{\textsc{#2}\vspace{10pt}}
				\par
				}
				{
			\end{tcolorbox}
	\end{center}
}

\newenvironmentx{notitlebox}[1][1=\textwidth]
{
	\begin{center}
			\begin{tcolorbox}[colback=white,colframe=systemx,arc=2mm,fonttitle=\scshape,width = #1]
				}
				{
			\end{tcolorbox}
	\end{center}
}



\mode<all>
