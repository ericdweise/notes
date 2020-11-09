# LaTeX




## Math

- Inline math formulas use `\(   \)`
- Block math formulas use: `\[   \]`
- The package `amsmath` adds a lot of math functions and symbols.
- The package `amssymb` gives you access to a many more math symbols.

### Math Snippets
#### Piecewise Functions
Preamble:
```tex
\usepackage{amsmath}
```

LaTeX:
```tex
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
