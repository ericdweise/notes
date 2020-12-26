# LaTeX

A quickstart guide to latex.


## Installation

#### APT (Debian/Ubuntu)

```bash
apt install texlive-latex-extra
```

#### Pacman (Manjaro)

```bash
sudo pacman -S texlive-latexextra
```


## Compiling Documents

```bash
pdflatex -halt-on-error LATEX_FILE
```



## Images
<details>
<summary>Show:</summary>

Quick guide to adding images.

```tex
%% Preamble
\usepackage{graphicx}

%% Document
\begin{figure}[h]
    \centering
        \includegraphics[width=0.5\textwidth]{ IMAGE_PATH }
        \caption{ CAPTION }
\end{figure}
```

### Placement

| value |  placement                               |
|-------|------------------------------------------|
| h 	| Approx. here                             |
| H 	| Precisely here. Requires float package   |
| t 	| Top of page.                             |
| b 	| Bottom of page.                          |
| p 	| Special page for floats only.            |
| ! 	| Override positional optimization         |

</details>



## Math
<details>
<summary>Show:</summary>


- Inline math formulas use `\(   \)`
- Block math formulas use: `\[   \]`
- The package `amsmath` adds a lot of math functions and symbols.
- The package `amssymb` gives you access to a many more math symbols.

### Math Symbols
A list of symbols I use often:

| symbol                 | LaTeX                  | Description                                |
|------------------------|------------------------|--------------------------------------------|
| $\mathbb{R}$           | `\mathbb{R}`           | Real Numbers                               |
| $\mathbb{N}$           | `\mathbb{N}`           | Natural Numbers                            |
| $\mathbb{Z}$           | `\mathbb{Z}`           | Zahlen Numbers (integers)                  |
| $\mathbb{Q}$           | `\mathbb{Q}`           | Complex Numbers                            |
| $\mathbb{1}$           | `\mathbb{1}`           | Identity Matrix                            |
| $\dagger$              | `\dagger`              | Adjoint Operator (Hermitian Conjugate)     |
| $\cap$                 | `\cap`                 | Intersection (set theory)                  |
| $\cup$                 | `\cup`                 | Union (set theory)                         |

### Math Snippets

#### Align
In block sections the `align` function is used to line up formulas horizontally.
Each new line in the `align` block can have different anchor points, at `&`, `&&`, etc.
These anchor points will match horizonally on each new line.

LaTeX:
```tex
\begin{align}
    f(x) & = x^2 + 4^x + 3 \\
         & = (x+3)(x+1)   && \text{factoring the polynomial} \\
         & && \{Now we can find the roots}
\end{align}
```
Output:
$$  \begin{align}
    f(x) & = x^2 + 4^x + 3 \\
         & = (x+3)(x+1)   && \text{factoring the polynomial} \\
         & && \text{Now we can find the roots}
\end{align} $$

#### Piecewise Functions
LaTeX:
```tex
\usepackage{amsmath}
\[
    f(x) = \begin{cases}
        \frac{1}{2} \text{ $x$ is heads} \\
        \frac{1}{2} \text{ $x$ is tails}
    \end{cases}
\]
```

Output:
$$ f(x) = \begin{cases}
\frac{1}{2} \text{ $x$ is heads} \\
    \frac{1}{2} \text{ $x$ is tails}
\end{cases} $$

</details>



## Symbols
The complete list of symbols can be found on [CTAN](http://tug.ctan.org/info/symbols/comprehensive/symbols-a4.pdf),
but it has wandered in the past.
This includes all font symbols, arrows, mathematical characters, and musical symbols, and more.


## My LaTeX Document Templates
My Tex templates.
[Homework](storage/homework.tex)
[Presentation](storage/presentation.tex)
