# Information Theory

Information theory is the study of how to store and transmit data in the most effective way.
Some of the big questions that Information Theory tries to answer are:
1. How much Information Exists?
2. What is the smallest amount of data that can accurately describe the set?
3. How much information can be sent or stored given available resources?


## Fundamentals
Background, fundamentals, and prerequisites.

### Basic Probability Theory


### Elementary Definitions
Throughout this document I will try to stick to these definitions.

#### Experiments, Outcomes, and Probabilities

- An **experiment** is an event with random outcomes.
- The **set of possible outcomes** of an experiment are described by capital letters ($X, Y, Z$).
- A single **outcome** of an experiment is described by a lower case letter ($x,y,z$) and is said to exist in the set of possible outcomes ($x \in X$ and $y \in Y$).
- The **probability mass function**, $p(x)$, tells us the likelyhood of the outcome $x$ occurring when the experiment is performed.

##### Example 1
A coin flip is an experiment with two outcomes, heads or tails, or $X = \{heads, tails\}$.
If the coin is fair (if one side isn't weighted) then the probability mass function is:

$$ p(x) = \begin{cases}
    \frac{1}{2} \text{ $x$ is heads} \\
    \frac{1}{2} \text{ $x$ is tails}
\end{cases} $$

##### Example 2
An unfair dice might be weighted in such a way that the number 1 is biased.
A probability mass function for rolling the dice once might be:
$$ p(x) = \begin{cases}
    \frac{1}{4} \ \ x=1 \\
    \frac{1}{6} \ \ x=2 \\
    \frac{1}{6} \ \ x=3 \\
    \frac{1}{6} \ \ x=4 \\
    \frac{1}{6} \ \ x=5 \\
    \frac{1}{12} \ \ x=6
\end{cases} $$


# References
1. Elements in Information Theory, Second Ed. Thomas M. Cover and Joy A. Thomas
