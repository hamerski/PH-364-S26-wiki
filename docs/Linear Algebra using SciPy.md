---
 - SciPy
 - Linear Algebra Functions
---
I chose to use the SciPy libary and the linear algebra module within it. The documentation for the module can be found here at https://docs.scipy.org/doc/scipy/reference/linalg.html. The user guide for the library can be found at https://docs.scipy.org/doc/scipy/tutorial/index.html and, for the linear algebra module, can be found at https://docs.scipy.org/doc/scipy/tutorial/linalg.html.

The SciPy library is designed to provide functions to perform a broad range of common mathematics and data processing operations. Scipy provides a range of modules including, for example, those providing functions to perform calculus operations, including integration and differentiation. In addition, it allows the computation of the Fast Fourier Transform of a given dataset, allowing the harmonic frequencies that can be used to describe the dataset to be determined. The library has functions for performing interpolation, allowing for datasets to be smoothed out. One can perform multidimensional image processing, utilizing functions to perform alterations of images, apply filters to images, among other things. Similarly to the image processing module, one can perform signal processing involving various array operations. These are some examples of the library's functionality, and, overall, the SciPy library provides convenient functions for performing mathematics and data manipulation that would be cumbersome to code from scratch.

The module I am using (scipy.linalg) allows many operations and tests in linear algebra to be performed. This includes basic functions that find the transpose of a matrix and find the solution to a matrix equation. But the module provides functions to perform more complex operations and tests, such as testing if a matrix is Hermitian or finding the eigenvectors of a given square matrix.


```python
#Importing linear algebra module from SciPy library
from scipy import linalg
#Importing Numpy library for needed secondary functions
import numpy as np

#Defining size of matrix
N = 4

#Initializing matrix as a square matrix of dimensions N
k = np.zeros((N,N))

#Replacing the entries in the matrix with the necessary coefficients
for i in range(N):
    k[i,i-1] = 1
    k[i,i] = -2
    if i+1 == k.shape[0]:
        k[i,0] = 1
    else:
        k[i,i+1] = 1
    
#linalg.eigh function within linear algebra module finds eigenvectors and eigenvalues for Hermitian matrix, which this matrix is
evals, evecs = linalg.eigh(k)

#Rouding eigenvector component values and eigenvalues to 2 decimal digits
for i in range(N):
    evals[i] = np.round(evals[i],2)
    for j in range(N):
        evecs[i,j] = np.round(evecs[i,j],2)

#Displaying the computed eigenvectors and eigenvalues for the given matrix
print("The eigenvectors are:")
print(evecs)
print("with corresponding eigenvalues of:")
print(evals)
```

    The eigenvectors are:
    [[ 0.5   0.    0.71 -0.5 ]
     [-0.5  -0.71  0.   -0.5 ]
     [ 0.5   0.   -0.71 -0.5 ]
     [-0.5   0.71  0.   -0.5 ]]
    with corresponding eigenvalues of:
    [-4. -2. -2.  0.]

