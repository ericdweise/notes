# Linear Algebra

Just the basics.



## Vector Spaces
<details>
<summary>Show:</summary>

A **Vector Space** $V$ is defined over a field $F$ is a non-empty set that has two operations:
1. Vector Addition: $+:V \times V \to V$
2. Scalar Multiplication: $\cdot:F \times V \to V$

Satisfying the following properties for all $u,v,w \in V$ and $\alpha,\beta \in F$:

1. Closure: $u+v \in V$ and $\alpha \cdot v \in V$
2. Commutativity (addition): $u+v = v+u$
3. Associativity: $u+(v+w) = (u+v)+w$
4. Zero Vector: $\exists 0 \in V$ such that $0+v=v$
5. Additive Inverse: $\exists -v \in V$ such that $v+(-v)=0$
6. Commutativity (multiplication): $\alpha\cdot(\beta\cdot v)= (\alpha\times\beta)\cdot v$
7. Field Identity preserves vector: $1\cdot v = v$
8. Distributivity: $\alpha \cdot (u+v) = \alpha\cdot u + \alpha \cdot v$

### Vector Subspaces
A **Subspace** is a subset of a vector space that is itself a vector space.
Properties 2, 3,

</details>





## Column and Range space
<details>
<summary>Show:</summary>


</details>





## Linear Independence
<details>
<summary>Show:</summary>

A set of nonzero vectors $v_1, \ldots, v_n$ in a vector space $V$ over field $F$ is **linearly dependent** if there exists some set of field elements $\alpha_1, \ldots, \alpha_n$ not all zero such that:
$$ 0 = \sum_{i=1}^n \alpha_i \cdot v_i $$
If no such set of $\alpha_i$ exists then the set of vectors is **linearly independent**.

</details>





## Inner Products
<details>
<summary>Show:</summary>

Let $u,v,w \in V$, a vector space over field $F$.
A function, $<*,*>:V \times V \to F$ is called an inner product if:

1. $<u+v,w> \;=\; <u,w> + <v,w>$
2. $<\alpha \cdot u,w> \;=\; \alpha <u,w>$
3. $<u,v> \;=\; \overline{<v,u>}$, (where $\overline{\alpha}$ is the complex conjucate of $\alpha$)
4. $<u,u> \;\geq\; 0$ with equality iff $u=0$

### Orthogonality
Two nonzero vectors $u$ and $v$ are orthogonal if $<u,v$=0$

#### Consequences
- Orthogonal vectors are also linearly independent

</details>





## Hilbert Spaces
<details>
<summary>Show:</summary>


</details>





## Vector and Matrix Norms
<details>
<summary>Show:</summary>

A function $||\;|| : V \to \mathbb{R}^+$ satisfying:

1. $||\alpha \cdot v|| = |\alpha| \cdot ||v||$
2. $||v|| \geq 0$ with equality iff $v=0$
3. $||u+v|| \leq ||u||+||v||$

</details>






## Unitary Matrices
<details>
<summary>Show:</summary>

$$A^HA = \mathbb(1) = AA^H$$


</details>





## Matrix Inverses
<details>
<summary>Show:</summary>


### Right Inverses

### Left Inverse

### Inverse

### Pseudo Inverse

</details>





## Jordan Canonical Form
<details>
<summary>Show:</summary>


</details>





## Singular Value Decomposition
<details>
<summary>Show:</summary>


</details>





## Graham Schmidt Orthogonalization
<details>
<summary>Show:</summary>


</details>





##
<details>
<summary>Show:</summary>


</details>





##
<details>
<summary>Show:</summary>


</details>
