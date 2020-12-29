# BibLatex

The `BibLatex` system is a framework for building bibliographies and adding citations in LaTeX documents.




## Prerequesites
You will need to install the `biber` package.
On Debian systems you can install this using:

```bash
apt install biber
```




## The BibTex File
The BibTex file is the heart of your citation database.
It is the same format for BibTex and a BibLatex databases.
This is just a text file with a list of citations.
There are ways to generate a BibTex file automatically (for example, see [Inciteful](inciteful.xyz).)

Each citation in the BibLatex database is a data structure similar to JSON.
If you want to build your own BibTex file you need to follow this structure.
Key-value pairs store relevant information.
Different citation types have different required fields.
Common citations are listed below:

<details>
<summary>Show citation types</summary>

#### Article
Used for journal articles.

```tex
@ARTICLE{key,
    author = {},  % REQUIRED
    title  = {},  % REQUIRED
    journal = {}, % REQUIRED
    year = {},    % REQUIRED
    volume = {},
    number = {},
    pages  = {}
}
```

#### Book
Use if an entire book is referenced.

```tex
@BOOK{key,
    author = {},    % REQUIRED
    title = {},     % REQUIRED
    publisher = {}, % REQUIRED
    year = {},      % REQUIRED
    series = {}
}
```

#### Inbook
Use if referencing specific pages from a book.

```tex
@INBOOK{key,
    author = {},
    title = {},
    publisher = {},
    year = {},
    pages = {},
}
```

#### Website
Use if citing something from the internet.

```tex
@MISC{key,
	author = {},
	title = {},
	month = {},
	year = {},
	howpublished = {\url{ URL }},
	note = {Accessed on YYYY-MM-DD}
}
```

#### Thesis
Use for masters or phd thesis.

```tex
@mastersthesis{
or 
@phdthesis{key,
    author = {},    % REQUIRED
    title = {},     % REQUIRED
    publisher = {}, % REQUIRED
    year = {},      % REQUIRED
    address = {}
}
```

#### Technical Report

```tex
@techreport{key,
    author = {},    % REQUIRED
    title = {},     % REQUIRED
    publisher = {}, % REQUIRED
    year = {},      % REQUIRED
    series = {},
    volume = {},
    address = {},
}
```

#### In Collection
Use for an article published in a bound book or volume.

```tex
@incollection{key,
    author = {},    % REQUIRED
    title = {},     % REQUIRED
    booktitle = {}, % REQUIRED
    year = {},      % REQUIRED
    editor = {},
    publisher = {},
    address = {},
    pages = {}
}
```
</details>




## Citing a Reference
To insert a citation inside your article use the `\cite{key}` command.
The `key` must be one of the entries in your BibTex file.
You can use any number of references in one citation.
If you do this the keys must be comma separated.
The `key` is the first element in a BibTex entry, e.g. `einstein1` in `@article{einstein1, \ldots`

```tex
\cite{ key1 [, key2 [, ...]] }
```




## Styling
Styling is set during the `usepackage` directive.
Use the `style` option to change the format of citations and bibliograpy.
For example, `\usepackage[style=numeric]{biblatex}`.
These are possible styles:

- `numeric`
- `alphabetic`
- `reading`
- `authoryear`

Fine control of the citations and bibliography formats can be exerted using the `citestyle` and `bibstyle`.
These take the same values as `style`.

The order that your references are shown in the bibliography can be changed using the `sorting` option.
Possible values are:

- `nty` order by name, title, year
- `nyt` order by name, year, title
- `nyvt` order by name, year, volume, title
- `anyt` order by alphabetic label, name, year, title
- `anyvt` order by alphabetic label, name, year, volume, title
- `ynt` order by year, name, title
- `ydnt` order by year (descending order), name, title
- `none` no sorting. Entries appear in the order they appear in the text.




## Printing the Bibliography.
You can choose where the bibliography is displayed.
Usually this will go at the very end of the document, but you might want to put an annex or afterword after the references.
The bibliography is displayed where you use this command:

```tex
\printbibliography
```




## Compiling
Compiling needs to be done in several steps (don't ask me why.)
Suppose you're working on a document called `report.tex`, this is what you do:

```bash
pdflatex report.tex  # This generates a .bcf with the citations not filled in
biber report.bcf     # Parses the .bib file(s) and fills in the blanks in the .bcf file
pdflatex report.tex  # Create the PDF with references filled in
pdflatex report.tex  # Run this just in cases page numbers are messed up
```




## References

- [OverLeaf Guide](https://www.overleaf.com/learn/latex/Articles/Getting_started_with_BibLaTeX)
- [Bibliography in Latex with Bibtex/Biblatex](https://www.latex-tutorial.com/tutorials/bibtex/)
- [BibTex Formats](http://web.mit.edu/rsi/www/pdfs/bibtex-format.pdf)
