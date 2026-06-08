# Finite-Difference Methods as Matrices

## Introduction

Finite-difference methods are used to approximate functions and their derivatives by sampling the function at a finite number of points. This is particularly useful for solving differential equations. Suppose you have a function $f$ defined on an interval $[a,b]$ whose behavior is described by a differential equation. Functions tend to be defined at an infinite number of points, so to represent it computationally we need to make some approximations. The first step is to choose a set of points to sample the function at, say $\{a, a + \delta x, a + 2 \delta x, ..., b - \delta x, b\}$. The value of the function at this set of points can then be stored in an array. In doing this, we've essentially chosen to represent the function as a vector in a finite-dimensional subspace of position space. Each element of the array corresponds to a coefficient of one of the basis vectors. This means that finite-difference methods are best suited for situations where the function is well approximated by the position basis. If the funciton is more naturally represented in a space of exponentials, spherical harmonics, etc., you should likely try to approximate the function in a different way.

Say we've decided $f$ is well respresented in the position basis. The next step is to write the differential equation as a finite difference equation by approximating the differential operators. For example, a second derivative can be written using the equation
$$ \frac{\text{d}^2 f_i}{\text{d} x^2} \approx \frac{f_{i-1} - 2f_i + f_{i+1}}{\delta x^2} . $$
The expression $f_i$ refers to the value of the array representing $f$ at the $i^\text{th}$ index. Notice that this equation is a linear equation with respect to $f$. Therefore we can consider this derivative to be a linear operator (matrix) acting on $f$.

Representing this equation as a matrix has several benefits. First, it allows the computer to parallelize computation of the derivative at every point of $f$, significantly speeding up your program. If you are concerned about reducing your program runtime, using matrices to perform finite-difference methods will be advantageous. Second, representing a differential operator as a matrix is very convenient for situations where you want to compute its eigenvalues and eigenvectors. This is very relevant for solving differential eigenvalue equations, like the ones that occur when using separation of variables on partial differential equations.

## Implementation

Returning to the equation for approximating a second derivative, we want to express it in matrix form. We can do so with the following matrix multiplication.
$$ \frac{\text{d}^2 f_i}{\text{d} x^2} \approx \frac{1}{\delta x^2} \begin{pmatrix} \cdots&1&-2&1&\cdots \end{pmatrix} \begin{pmatrix} \vdots \\ f_{i-1} \\ f_{i} \\ f_{i+1} \\ \vdots \end{pmatrix} $$

To compute this derivative at each index $i$ of the function, we can express the differential operator as a 2D matrix.
$$ \frac{\text{d}^2 f}{\text{d} x^2} \approx \frac{1}{\delta x^2} \begin{pmatrix}
-2 & 1 & 0 & \cdots & 1 \\
1 & -2 & 1 & \cdots & 0 \\
0 & 1 & -2 & \cdots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
1 & 0 & 0 & \cdots & -2
\end{pmatrix} \begin{pmatrix} f_{1} \\ f_{2} \\ \vdots \\ f_{n} \end{pmatrix} $$
Notice that at the upper left and lower right corners of the matrix, the equation gets "cut off" because there is no last or next index of $f$. How this issue should be resolved depends on the boundary conditions of the physical situation. For example, putting 1's in the upper right and lower left corners (as above) enforces periodic boundary conditions.

Next, we want to try to construct this matrix in code. Since the matrix is zero every except the main diagonal, the two off diagonals, and the corners, a useful function for this puprose is `numpy.diag`. This function takes a 1D array of values and constructs a matrix with these entries on the main diagonal. An optional parameter `k` can be used to have it create a matrix with the values on an off diagonal instead.


```python
import numpy as np

def SecondDerivative(N, dx=1):
  main_diagonal = np.diag([-2 for n in range(N)]) # The main diagonal should consist entirely of the numeber -2
  off_diagonal = np.diag([1 for n in range(N-1)], k=1) # Similarly, the off diagonals should be all 1
  corner = np.diag([1], k=N-1) # Use a single element array to place a single 1 in the corners
  differential_operator = (main_diagonal + off_diagonal + off_diagonal.T + corner + corner.T) / dx**2
  return differential_operator

N = 10 # Number of points f is defined at
print(SecondDerivative(N))
```

    [[-2.  1.  0.  0.  0.  0.  0.  0.  0.  1.]
     [ 1. -2.  1.  0.  0.  0.  0.  0.  0.  0.]
     [ 0.  1. -2.  1.  0.  0.  0.  0.  0.  0.]
     [ 0.  0.  1. -2.  1.  0.  0.  0.  0.  0.]
     [ 0.  0.  0.  1. -2.  1.  0.  0.  0.  0.]
     [ 0.  0.  0.  0.  1. -2.  1.  0.  0.  0.]
     [ 0.  0.  0.  0.  0.  1. -2.  1.  0.  0.]
     [ 0.  0.  0.  0.  0.  0.  1. -2.  1.  0.]
     [ 0.  0.  0.  0.  0.  0.  0.  1. -2.  1.]
     [ 1.  0.  0.  0.  0.  0.  0.  0.  1. -2.]]


There are several key considerations when constructing a differential operator this way. First, Hermitian matrices have many nice properties, so it is often beneficial to make the differential operator Hermitian when possible. Second derivatives are nice in this respect because their matrix representation is symmetric. On the other hand, a first derivative is much harder to make symmetric without making other compromises as well. An integrating factor can be used to rewrite a second order linear differential equation so that all of its derivatives are contained a single term of the form $\frac{\text{d}}{\text{d}x} [p(x) \frac{\text{d}}{\text{d}x}]$. This operator can be written as a Hermitian matrix, and so is often the best form to use when implementing this technique.

Another important detail is the boundary conditions of the problem. The most common types of boundary conditions enforce that the function is 0 at the endpoints, that its derivative is 0 at the endpoints, or that the function is periodic. In the first case that the function is 0 at the endpoints, substituting a value of 0 into the original finite difference equation for the second derivative reveals that the terms at nonexistant indices, $f_{0}$ and $f_{n+1}$, can be effectively ignored as their value is 0. This results in a matrix similar to the example above except there are no 1's in the corners. Similar reasoning of substituing 0 into the relevant terms can be used for more complex differential operators with this boundary condition.

In the case of the function's derivative being 0 at the endpoints, a similar technique of plugging in 0 for the value of the derivative can be used. For an operator of the form $\frac{\text{d}}{\text{d}x} [p(x) \frac{\text{d}f}{\text{d}x}]$, this amounts to setting $p(x)$ to be 0 at the endpoints, which is equivalent to setting $\frac{\text{d}f}{\text{d}x}$ to 0 at the endpoints. For periodic boundary conditions, we treat the ends of the function as adjacent, so $f_{0}$ should refer to $f_{n}$, and $f_{n+1}$ should refer to $f_{1}$. This results in the finite difference equation "wrapping around" to the upper right and lower left corners of the matrix.

## Example

After preforming seperation of variables on the Hamiltonian eigenvalue equation for the hydrogen atom, the ordinary differential equation in $\phi$ is given by
$$ -\frac{\text{d}^2 \Phi}{\text{d} \phi^2} = B\Phi $$
where $B$ is some undetermined eigenvalue. This equation has periodic boundary conditions since $\Phi(\phi)$ is $2\pi$-periodic. Since this is an eigenvalue problem, it makes sense to reperesent and solve it as a matrix.


```python
import scipy.linalg

N = 500 # Number of points Phi(phi) is defined at. Can be increased to improve accuracy
DELTA_PHI = 2*np.pi / N # Distance between each value of phi

# The matrix representing the left-hand side of the differential equation is negative the second derivative operator
operator = -SecondDerivative(N, dx=DELTA_PHI)
# Use a library to solve for the eigenvalues and eigenvectors of the differential operator
eigenvalues, eigenvectors = scipy.linalg.eigh(operator)
# Print out the first 11 eigenvalues
print(eigenvalues[:11])
```

    [3.88536128e-12 9.99986841e-01 9.99986841e-01 3.99978945e+00
     3.99978945e+00 8.99893413e+00 8.99893413e+00 1.59966315e+01
     1.59966315e+01 2.49917764e+01 2.49917764e+01]


We can see that the eigenvalues of this differential operator are $m^2$, where $m$ is an integer. This is consistent with the analytic solution of the differential equation. To solve for the entire hydrogen atom numerically, this process simply needs to be repeated for the differential equations of $\theta$ and $r$.
