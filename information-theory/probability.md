# Basic Probability

Some fundamental probability axioms and results used in Information Theory.


## Random Variables
This page is only going to deal with **discrete** random variables.

- An **experiment** or a **random variable** is an event with random outcomes.
- The **set of possible outcomes** of an experiment are described by capital letters ($X, Y, Z$).
- A single **outcome** of an experiment is described by a lower case letter ($x,y,z$) and is said to exist in the set of possible outcomes ($x \in X$ and $y \in Y$).
- The **probability mass function**, $p(x)$, tells us the likelyhood of the outcome $x$ occurring when experiment $X$ is performed.
    (If we were dealing with continuous random variables we would call $p(x)$ a probability distribution function, PDF)

#### Example
A coin flip is an experiment with two outcomes, heads or tails, or $X = \{heads, tails\}$.
If the coin is fair (if one side isn't weighted) then the probability mass function is:

$$ p(x) = \begin{cases}
    \frac{1}{2} \text{ $x$ is heads} \\
    \frac{1}{2} \text{ $x$ is tails}
\end{cases} $$


## Joint Probability Mass Functions
If There are two random variables $X$ and $Y$, which have outcomes $\{x_1, \ldots, x_n\}$ and $\{y_1, \ldots, y_m\}$, respectively, then the vector $(X,Y)$ is also a discrete random variable.
It has the probility mass function $p(x,y)$, also called the **joint pmf**.
This PMF tells us that there is a $p(x_i,y_j)$ probability of observing $X=x_i$ and $Y=y_j$ together.

Sometimes we write the joint probability mass function as $p(X \cap Y)$.
This is just a restatement that the set of possible outcomes $(X,Y)$ is the intersection of the outcomes of $X$ and $Y$.
You will see $p(X,Y)$ and $P(X \cap Y)$ used interchangeably.

A joint probability mass function must satisfy:

1. $0 \leq p(x,y) \leq 1$, and
2. $\sum_{i=1}^n \sum_{j=1}^m p(x_i,y_j) = 1$

This logic can be extended to any number of random variables.
So, if we have a set of $n$ random events, the probability mass function will be $p(x_1, \ldots, x_n)$

#### Example
Consider flipping a fair coin (call this $X$) and rolling a fair dice ($Y$).
Then the joint probability function $p(x,y)$ for $x \in X$ and $y \in Y$:

| $x$ \ $y$ | 1              | 2              | 3              | 4              | 5              | 6              |
|-----------|----------------|----------------|----------------|----------------|----------------|----------------|
| heads     | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ |
| tails     | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ |


## Expected Value
The expected value of a function $g$ acting on a discrete random variable $X$ is defined as:

$$ E[g(X)] \equiv E_p g(X) = \sum_{x \in X} p(x)g(x) $$


## Conditional Probability
Consider two random variables, $X$ and $Y$, where the outcome of $Y$ is dependent on the outcome of $X$.
The following relationship is can be derived by multiplying the probabilities of two disjoint events $x_i$ and $y_j|x_i$:
$$ p(y_j|x_i) = \frac{p(y_j \cap x_i)}{p(x_i)} $$
If $X$ and $Y$ are independent then $p(y_j \cap x_i) = p(y_j)p(x_i)$ and this reduces to $p(y_j|x_i) = p(y_j)$, as expected.


#### Example
Consider flipping a coin ($X$) then drawing a ball out of a bag ($Y$), but the bag changes depending on the result of the coin flip.
If the coin is heads the bag has two white and one red balls, but if the bag is tails the bag has three white and two red balls. Then,
$$
p(white|heads) = \frac{2}{3}, \ \
p(red|heads) = \frac{1}{3} \\
p(white|tails) = \frac{3}{5}, \ \
p(red|tails) = \frac{2}{5} $$

Using $p(x,y) = p(y|x)p(x)$ we can calculate the joint probability mass function:

| $x$ \ $y$ | white          | red           |
|-----------|----------------|---------------|
| heads     | $\frac{1}{3}$  | $\frac{1}{6}$ |
| tails     | $\frac{3}{10}$ | $\frac{1}{5}$ |

We can verify these probabilities by counting all the possibe outcomes.


## References

1. [Introduction to Probability and Statistics, MIT OpenCourseWare](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading7a.pdf)
