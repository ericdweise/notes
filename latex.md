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


## LaTeX Document Templates
[Homework](storage/homework.tex)
