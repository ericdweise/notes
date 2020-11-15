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

- An **experiment** or a **random variable** is an event with random outcomes.
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




## Shannon Entropy
The entropy of a random experiment, $X$ (which has discrete outcomes), is defined as
$$ H(X) = -\sum_{x \in X} p(x) \cdot log_2(p(x)) $$

##### Example
An unfair dice might be weighted in such a way that the number 1 is biased.
A probability mass function for rolling the dice once might be:
$$ p(x) = \begin{cases}
    \frac{1}{4} \ \ x=1, \ \ \frac{1}{6} \ \ x=2, \ \ \frac{1}{6} \ \ x=3, \\
    \frac{1}{6} \ \ x=4, \ \ \frac{1}{6} \ \ x=5, \ \ \frac{1}{12} \ \ x=6
\end{cases} $$
The entropy of tossing this dice once is
$$ H(X) = \frac{1}{4}log(4) + 4\Big(\frac{1}{6}log(6)\Big) + \frac{1}{12}log(12) = 2.522$$
Compare this to the "fair" dice:
$$ H(X_{fair}) = 6\Big(\frac{1}{6}log(6)\Big) = 2.585 $$

### Properties of Shannon Entropy
If $p(x)=0$ then $p(x) \cdot log(p(x))=0$. This can be proven even for discrete probability mass functions by finding the value of the continuous function  $x \cdot log(x)$ as $x$ aproaches $0$.

1. Negative entroy, $-H(X)$, is a convex function.
    This means we can find maximum entropy (minimum negative entropy) using convex optimization.
    We can also use Lagrange multipliers to solve some problems.
2. For a given set of outcomes the maximum entropy is achieved when the probability distribution is uniform.
   Entropy is maximized when we know the least about the outcome.
3.

### Joint Entropy
Two random variables can be joined together to form a single random variable.
Given random variables $X$ and $Y$, the vector $(X,Y)$ can be thought of as a single random variable.
To see this, know that there are set of possible outcomes for $X$ and a set of possible outcomes for $Y$.
Joining these outcomes in a vector is still has random outcomes.
the probability of observing $x$ from $X$ and $y$ from $Y$ is denoted $p(x,y)$.

The **Joint Entropy** of this joint distribution is defined to be:
$$ H(X,Y) = -\sum_{x \in $X} \sum_{y \in Y} p(x,y) log \big(p(x,y)\big) $$

Note that this says nothing about the independence of $X$ and $Y$.
It only says that if we know the probabilities for every outcome in the joint distribution we can find the entropy of the system.

This holds true for systems of any number of random variables: $(X_1, X_2, \ldots , X_n)$.

##### Example
Let two events be flipping a fair coin and picking a ball out of a bag containing one white and two red balls.
The separate outocomes are:
$$ p(x) = \begin{cases} \frac{1}{2} \text{ heads}, \ \ \frac{1}{2} \text{ tails} \end{cases} $$
and
$$ p(y) = \begin{cases} \frac{1}{3} \text{ white}, \ \ \frac{2}{3} \text{ red} \end{cases} $$
But the joint outcome has probability distribution:
$$
p(x,y) = \begin{cases} \frac{1}{6} \text{ (heads, white),} \ \
\frac{1}{6} \text{ (tails, white),} \\
\frac{1}{3} \text{ (heads, red),} \ \
\frac{1}{3} \text{ (tails, red)}
\end{cases} $$
And the entropy of this joint distribution is:
$$ H(X,Y) = 2 \Big( \frac{1}{6} log(6) \Big) + 2 \Big( \frac{1}{3} log(3) \Big) = 1.918 $$

### Conditional Entropy

### Relative Entropy

### Mutual Information

### Chain Rules



## Dependent Random Variables

## Markov Chains



# References
1. Elements in Information Theory, Second Ed. Thomas M. Cover and Joy A. Thomas
