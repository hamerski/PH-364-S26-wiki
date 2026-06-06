---
tags:
  - numpy
---


One of the most common forms of math to show up in computer science is linear algebra. Because of this, a lot of effort has been put into making matrix operations very fast. On the hardware side, computers can perform operations on vectors and matrices directly, rather than having to loop through each index manually. This can provide massive performance gains if you are able to utilize these operations. One of the best ways to access these instructions in python is through the package `numpy`. Not only do many of the `numpy` functions make full use of your computer's capabilities, but they also are written by skilled programmers using the most efficient algorithms discovered over the past decades. So as long as you are using library functions correctly, they will end up being faster than anything you could write. One example of this is computing the total energy in a lattice of spins according to the formula
$$ E = -\sum_{i,j} S_i S_j . $$
I benchmarked the following code to be 500x faster than the implementation not using numpy functions.

```python
import numpy as np

def calc_lattice_energy_with_matrix(lattice):
  column_sum = np.einsum('ij,ij->', lattice[1:], lattice[:-1])
  row_sum = np.einsum('ij,ij->', lattice[:, 1:], lattice[:, :-1])
  return -(column_sum + row_sum)
```



