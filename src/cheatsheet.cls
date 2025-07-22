%% cheatsheet.cls
%% A LaTeX document class for creating academic cheat sheets
%% 
%% This class provides a flexible template for creating multi-column
%% cheat sheets with boxed sections and customizable styling.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2025/07/22 v1.0 Cheat Sheet Document Class]

% Font size options
\newcommand{\@fontsize}{10pt}
\DeclareOption{8pt}{\renewcommand{\@fontsize}{8pt}}
\DeclareOption{9pt}{\renewcommand{\@fontsize}{9pt}}
\DeclareOption{10pt}{\renewcommand{\@fontsize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\@fontsize}{11pt}}
\DeclareOption{12pt}{\renewcommand{\@fontsize}{12pt}}

% Number of columns option
\newcommand{\@numcols}{3}
\DeclareOption{1col}{\renewcommand{\@numcols}{1}}
\DeclareOption{2col}{\renewcommand{\@numcols}{2}}
\DeclareOption{3col}{\renewcommand{\@numcols}{3}}
\DeclareOption{4col}{\renewcommand{\@numcols}{4}}

% Pass unknown options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Process options
\ProcessOptions\relax

% Load base class
\LoadClass[\@fontsize]{article}

% Required packages
\RequirePackage[landscape]{geometry}
\advance\topmargin-.8in
\advance\textheight3in
\advance\textwidth3in
\advance\oddsidemargin-1.5in
\advance\evensidemargin-1.5in

\RequirePackage{url}
\RequirePackage{multicol}
\RequirePackage{amsmath}
\RequirePackage{esint}
\RequirePackage{amsfonts}
\RequirePackage{tikz}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{verbatim}
\RequirePackage{graphicx}

% Language support
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}

% TikZ libraries
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{shapes,arrows}
\usetikzlibrary{positioning}

% Optional packages (load only if available)
\IfFileExists{chessfss.sty}{\RequirePackage{chessfss}}{}
\IfFileExists{colortbl.sty}{\RequirePackage{colortbl}}{}
\IfFileExists{bodegraph.sty}{\RequirePackage{bodegraph}}{}

% Define color scheme
\definecolor{bblue}{rgb}{0, 0.4470, 0.7410}
\definecolor{oorange}{rgb}{0.8500, 0.3250, 0.0980}
\definecolor{yyellow}{rgb}{0.9290, 0.6940, 0.1250}
\definecolor{ppurple}{rgb}{0.4940, 0.1840, 0.5560}
\definecolor{ggreen}{rgb}{0.4660, 0.6740, 0.1880}
\definecolor{bbblue}{rgb}{0.3010, 0.7450, 0.9330}

% Paragraph settings
\parindent0pt
\parskip2pt

% Remove page numbering
\pagestyle{empty}

% TikZ styles for cheat sheet boxes
\tikzstyle{mybox} = [draw=black, fill=white, very thick, rectangle, rounded corners, inner sep=10pt, inner ysep=10pt]
\tikzstyle{fancytitle} = [fill=black, text=white, font=\bfseries]
\tikzstyle{block} = [draw, rectangle, minimum height=3em, minimum width=6em, thick]
\tikzstyle{sum} = [draw, circle, node distance=1cm, thick]
\tikzstyle{input} = [coordinate]
\tikzstyle{output} = [coordinate]
\tikzstyle{pinstyle} = [pin edge={to-,thin,black}]

% Customizable variables
\newcommand{\cheatsheettitle}{Cheat Sheet}
\newcommand{\cheatsheetsubtitle}{}
\newcommand{\cheatsheetversion}{v1.0}
\newcommand{\cheatsheetdate}{\today}
\newcommand{\cheatsheetauthor}{}
\newcommand{\cheatsheetinstitution}{}
\newcommand{\cheatsheetsource}{}

% Commands to set cheat sheet information
\newcommand{\setcheatsheettitle}[1]{\renewcommand{\cheatsheettitle}{#1}}
\newcommand{\setcheatsheetsubtitle}[1]{\renewcommand{\cheatsheetsubtitle}{#1}}
\newcommand{\setcheatsheetversion}[1]{\renewcommand{\cheatsheetversion}{#1}}
\newcommand{\setcheatsheetdate}[1]{\renewcommand{\cheatsheetdate}{#1}}
\newcommand{\setcheatsheetauthor}[1]{\renewcommand{\cheatsheetauthor}{#1}}
\newcommand{\setcheatsheetinstitution}[1]{\renewcommand{\cheatsheetinstitution}{#1}}
\newcommand{\setcheatsheetsource}[1]{\renewcommand{\cheatsheetsource}{#1}}

% Environment for creating cheat sheet sections
\RequirePackage{environ}
\NewEnviron{cheatsheetbox}[2]{%
    \begin{tikzpicture}
        \node [mybox] (box){%
            \small
            \begin{minipage}{0.3\textwidth}
                \BODY
                \vspace{#2}
            \end{minipage}
        };
        \node[fancytitle, right=10pt] at (box.north west) {#1};
    \end{tikzpicture}
}

% Command to create the title section
\newcommand{\makecheatsheettitle}{%
    \begin{tikzpicture}
        \node [] (box){%
            \huge
            \begin{minipage}{0.3\textwidth}
                \begin{center}
                    \cheatsheettitle\\
                    \footnotesize \textcolor{bblue}{\texttt{[\cheatsheetversion\ - \cheatsheetdate]}}
                \end{center}
            \end{minipage}
        };
    \end{tikzpicture}
}

% Command to create footer with attribution
\newcommand{\makefooter}{%
    \scriptsize
    \raggedleft
    \ifx\cheatsheetsource\empty\else
        Based on \cheatsheetsource\\
    \fi
    Transcribed, edited and adapted by\\
    \ifx\cheatsheetauthor\empty\else
        \cheatsheetauthor\\
    \fi
    \ifx\cheatsheetinstitution\empty\else
        \cheatsheetinstitution\\
    \fi
}

% Command to add spacing (useful between sections)
\newcommand{\sectionbreak}{\vspace{1.25cm}}

\endinput
