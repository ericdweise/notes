# LaTeX





## Math

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

### Math Snippets
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


## LaTeX Document Templates
[Homework](storage/homework.tex)
