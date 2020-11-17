# Information Theory

Information theory is the study of how to store and transmit data in the most effective way.
Some of the big questions that Information Theory tries to answer are:

1. How much Information Exists?
2. What is the smallest amount of data that can accurately describe the set?
3. How much information can be sent or stored given available resources?



## First, Probability
### Random Variables
This page is only going to deal with **discrete** random variables.

- An **experiment** or a **random variable** is an event with random outcomes.
- The **set of possible outcomes** of an experiment are described by capital letters ($X, Y, Z$).
- A single **outcome** of an experiment is described by a lower case letter ($x,y,z$) and is said to exist in the set of possible outcomes ($x \in X$ and $y \in Y$).
- The **probability mass function**, $p(x)$, tells us the likelyhood of the outcome $x$ occurring when experiment $X$ is performed.
    (If we were dealing with continuous random variables we would call $p(x)$ a probability distribution function, PDF)

##### Example
A coin flip is an experiment with two outcomes, heads or tails, or $X = \{heads, tails\}$.
If the coin is fair (if one side isn't weighted) then the probability mass function is:

$$ p(x) = \begin{cases}
    \frac{1}{2} \text{ $x$ is heads} \\
    \frac{1}{2} \text{ $x$ is tails}
\end{cases} $$


### Joint Probability Mass Functions {#joint-prob}
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

##### Example
Consider flipping a fair coin (call this $X$) and rolling a fair dice ($Y$).
Then the joint probability function $p(x,y)$ for $x \in X$ and $y \in Y$:

| $x$ \ $y$ | 1              | 2              | 3              | 4              | 5              | 6              |
|-----------|----------------|----------------|----------------|----------------|----------------|----------------|
| heads     | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ |
| tails     | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ | $\frac{1}{12}$ |


### Conditional Probability
Consider two random variables, $X$ and $Y$, where the outcome of $Y$ is dependent on the outcome of $X$.
The following relationship is can be derived by multiplying the probabilities of two disjoint events $x_i$ and $y_j|x_i$:
$$ p(y_j|x_i) = \frac{p(y_j \cap x_i)}{p(x_i)} $$
If $X$ and $Y$ are independent then $p(y_j \cap x_i) = p(y_j)p(x_i)$ and this reduces to $p(y_j|x_i) = p(y_j)$, as expected.


##### Example
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
3. $H(X) \leq log\big(|X|\big)$, where $|X|$ is the number of elements in $X$.
    Equality holds if $X$ has a uniform distribution.

### Interpretations of Entropy
1. Entropy measures the amount of information required on average to describe a random variable.

### Expected Value
The expected value of a function $g$ acting on a discrete random variable $X$ is defined as:
$$E[g(X)] \equiv E_p g(X) = \sum_{x \in X} p(x)g(x) $$

### Joint Entropy
We can extend the definition of Shannon Entropy to include joint probability distributions (see [Joint Probability Mass Functions](#joint-prob).)
If there are two random variables, $X$, and $Y$ with outcomes $\{x_1, \ldots,x_n\}$ and $\{y_1, \ldots, y_m\}$.
We join them together into the new random variable $(X,Y)$.
If this vector has joint probability mass function $p(x_i,y_j)$ for all $x_i \in X$ and $y_j \in Y$, then the **Joint Entropy** is:
$$ H(X,Y) = -\sum_{x \in X} \sum_{y \in Y} p(x,y) log \big(p(x,y)\big) $$

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
Consider two random variables, $X$ and $Y$, and the outcome of $Y$ depends on the outcome of $X$.
We define **conditional entropy** as
$$ \begin{align}
H(Y|X) &= \sum_{x \in X} p(x) H(Y|X=x) \\
       &= \sum_{x \in X} p(x) \sum_{y \in Y} p(y|x) log \big(p(y|x)\big) \\
       &= \sum_{x \in X} \sum_{y \in Y} p(x) \frac{p(x,y)}{p(x)} log\big(p(y|x)\big)
           && \text{ since } p(b|a) = \frac{p(a,b)}{p(a)} \\
       &= E
\end{align} $$

### Chain Rule for Entropy
$$ H(X,Y) = H(X) + H(Y|X) $$
proof:
$$ \begin{align}
    H(X,Y) &= - \sum_{x\in X}\sum_{y\in Y} p(x,y) log \big( p(x,y) \big) \\
        &= -\sum_{x\in X} \sum_{y\in Y} p(x,y) \ log \big( p(y|x) \ p(x) \big)
            && \text{ since } p(x,y) = p(y|x) \cdot p(x) \\
        &= -\sum_{x\in X} \sum_{y\in Y} p(x,y) \ log \big( p(y|x) \big) -\sum_{x\in X} \sum_{y\in Y} p(x,y) \ log \big( p(x) \big) \\
        &= H(Y|X) -\sum_{x\in X} p(x) \ log \big( p(x) \big)
            && \text{ since } \sum_{y}p(x,y) = p(x) \\
        &= H(Y|X) + H(X)
\end{align} $$

Using induction we can extend this to any number of random variables:
$$ H(X_1, \ldots, X_n) = \sum_{i=1}^n H(X_i|X_1, \ldots, X_{i-1})$$

### Relative Entropy
Measures the distance between two distributions.

**Relative Entropy** of two probability mass functions, $p$ and $q$, defined on the random variable $X$ is defined as:
$$ D(p||q) =
\sum_{x \in X} p(x) log \Big( \frac{p(x)}{q(x)} \Big)
\equiv E_p log \Big( \frac{p(X)}{q(X)} \Big) $$

#### Properties of Relative Entropy

1. $D(p||q)=0$ if $p$ and $q$ are the same
2. $D(p||q) \neq D(q||p)$
3. Not a distance function since the triangle inequality does not hold

### Chain Rule for Relative Entropy

$$ D\big( p(x,y)\ ||\ q(x,y) \big) = D\big( p(x)\ ||\ q(x) \big) + D\big( p(y|x)\ ||\ q(y|x) \big) $$

##### Example
For the random variable taking values in $\{1,2,3,4\}$ consider the following PMFs:
| $x\in X$ | 1             | 2             | 3             | 4             |
|----------|---------------|---------------|---------------|---------------|
| $p(x)$   | $\frac{1}{2}$ | $\frac{1}{4}$ | $\frac{1}{8}$ | $\frac{1}{8}$ |
| $q(x)$   | $\frac{1}{8}$ | $\frac{1}{8}$ | $\frac{1}{4}$ | $\frac{1}{2}$ |
| $r(x)$   | $\frac{1}{2}$ | $\frac{1}{6}$ | $\frac{1}{6}$ | $\frac{1}{6}$ |

Then

$$ \begin{align}
D(p||p) &= \Big(\frac{1}{2} + \frac{1}{4} + \frac{1}{8} + \frac{1}{8} \Big) log(1) &&= 0 \\
D(p||q) &= \frac{1}{2} log(4) + \frac{1}{4} log(2) + \frac{1}{8} log(\frac{1}{2}) + \frac{1}{8} log(\frac{1}{4}) &&= \frac{7}{8} \\
D(p||r) &= \frac{1}{2} log(1) + \frac{1}{4} log(\frac{3}{2}) + \frac{1}{8} log(\frac{3}{4}) + \frac{1}{8} log(\frac{3}{4}) &&= 0.0425\\
D(p||r) &= \frac{1}{2} log(1) + \frac{1}{6} \Big( log(\frac{2}{3}) + log(\frac{4}{3}) + log(\frac{4}{3}) \Big) &&= 0.0408
\end{align} $$

### Mutual Information
Given two discrete random variables $X$ and $Y$ with joind PMF $p(x,y)$ and marginal PMFs $p(x)$ and $p(y)$, the mutual information is defined as:
$$ I(X;Y) = \sum_x \sum_y p(x,y) log \Big( \frac{p(x,y)}{p(x)p(y)} \Big)$$
This can also be interpreted as:

1. The relative entropy between $p(x,y)$ and $p(x)p(y)$: $D\big(p(x,y)||p(x)p(y)))\big)$
2. The expected value: $E_{p(x,y)} log \big( \frac{p(X,Y)}{p(X)p(Y)} \big)$

#### Relationship to Entropy

$$ \begin{align}
I(X;Y) &= H(X) - H(X|Y) \\
\text{proof: } &\\
I(X;Y)
&= \sum_x \sum_y p(x,y) log\Big( \frac{p(x,y)}{p(x)p(y)} \Big) \\
&= \sum_x \sum_y p(x,y) log\Big( \frac{p(x|y)}{p(x)} \Big) \\
&= \sum_x \sum_y p(x,y) \Big( log\big( p(x|y) \big) - log\big( p(x) \big) \Big) \\
&= \sum_x \sum_y p(x,y) log\big( p(x|y) \big) - \sum_y\Big( \sum_x p(x,y) log\big(p(x)\big) \Big) \\
&= -H(X|Y) + \sum_y p(y)H(X) \\
&= -H(X|Y) + H(X)
\end{align} $$

#### Properties of Mutual Information

1. Symmetry: $I(X;Y) = I(Y;X)$
2. $I(X;Y) = H(X) − H(X|Y)$
3. $I(X;Y) = H(X) + H(Y) − H(X,Y)$
4. $I(X;X) = H(X)$
5. $I(X;Y) \leq H(X)$

#### Chain Rule for Mutual Information

$$ I(X_1, \ldots, X_n ; Y) = \sum_{i=1}^n I(X_i;Y | X_1, \ldots, X_{i-1}) $$

## Dependent Random Variables

## Markov Chains



# References
1. Elements in Information Theory, Second Ed. Thomas M. Cover and Joy A. Thomas
2. [Introduction to Probability and Statistics, MIT OpenCourseWare](https://ocw.mit.edu/courses/mathematics/18-05-introduction-to-probability-and-statistics-spring-2014/readings/MIT18_05S14_Reading7a.pdf)
