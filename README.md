# Cheat Sheet LaTeX Template

This repository offers a versatile, clean, multi‑column LaTeX template designed to help users produce professional cheat sheets, formula summaries, study guides, or reference cards with minimal effort. It leverages a pre‑configured cheatsheet class based on the CTAN package for automatic layout handling. Simply edit the main .tex, drop in your diagrams or code snippets, and compile—resulting in a dense, readable, and well‑formatted output that’s easily customizable to your style or branding.

<img width="3300" height="2550" alt="Image" src="https://github.com/user-attachments/assets/c604949f-4e75-487d-8b07-63682136a607" />

## Install

Download the [latest release](https://github.com/joaomarafuzgaspar/cheatsheet-latex-template/releases/latest) into the directory where you are preparing the cheatsheet.

## Usage

```latex
\documentclass[10pt,3col]{cheatsheet}

\setcheatsheettitle{Title}
\setcheatsheetauthor{Author}

\begin{document}
    \begin{cheatsheetbox}{Title}{vspace}
        ...
    \end{cheatsheetbox}
\end{document}
```

See [src/example.tex](src/example.tex)

## Authors

- [João Marafuz Gaspar](https://github.com/joaomarafuzgaspar)

## License

This work is licensed under a [Creative Commons Attribution Non Commercial Share Alike 4.0 International][cc-by-nc-sa].

[cc-by-nc-sa]: https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode