---
tags:
  - QuTip
  - quantum mechanics
---

## QuTip Dynamics and Time-Evolution: Schrödinger Equation

### Overview

The library QuTip provides tools for working with quantum systems, with a focus on quantum computing. The purpose of this module is to evolve some arbitrary quantum system in time according to the Schrödinger equation. As such, each of the functions requires an initial state to evolve and a Hamiltonian to describe the evolution. This module offers several functions that do this through different numerical methods.


### Physics Question

***How does the wavefunction of a quantum harmonic oscillator develop over time?***

To answer this question, we can approximate a continuous quantum wavefunction in position space by discretizing it, then applying finite difference methods to construct a Hamiltonian. From this point, QuTip can do the work of calculating the time evolution of the discretized wavefunciton. The process of discretizing the wavefunction and using finite-difference methods to set up the differential equation is very similar to the in-class activity we did for modeling a string using the wave equation.

The following code creates an animation of the time evolution of the probability distribution of a quantum state under a quadratic potential function.


```python
import qutip
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# Definition of constants
N = 500 # Number of discrete points in wavefunction
mass = 1 # Particle mass
omega = 1/2 # Potential strength

# Initialize quantum state so that it is equally probable to find the particle everywhere in space.
psi = qutip.Qobj([1 for _ in range(N)]).unit()

# psi[i] corresponds to an x position of 2i/N - 1, which are the diagonal entries of the x operator.
xhat = qutip.Qobj([[(2*i/N - 1) if i == j else 0 for j in range(N)] for i in range(N)])

# The same finite difference method we used for the second derivative string modeling is used here, just in matrix form. In this way, we can approximate the second derivative of the kinetic energy term of the Hamiltonian.
phat_square = qutip.Qobj([[2 if i == j else -1 if i+1 == j or i == j+1 else 0 for j in range(N)] for i in range(N)])

# We can now construct the Hamiltonian for a harmonic oscillator: H = p^2/2m + 1/2 m omega^2 x^2
Hamiltonian = 1/(2*mass) * phat_square + 1/2 * mass * omega**2 * xhat**2

# Create a list of the x positions of the elements of psi and a list of the time points we want to find
xvals = np.linspace(-1,1,N)
times = np.linspace(0, 5000, 500)

# Run the QuTip function from the Schrödinger equation module to compute the time evolution of psi
#  - The Hamiltonian input describes how the system should evolve with time
#  - The wavefunction (psi) input describes the initial state of the system
#  - The array of times tells the function which time points we want to calculate the wavefunction at
#  - The function returns a result object that stores information about the time evolution
#    - An array of the wavefunction at each requested time point accessible through res.states
res = qutip.sesolve(Hamiltonian, psi, times)


# Create an animation of the probability density over time to visualize the results
fig, ax = plt.subplots()
plt.xlabel(r'Position $x$')
plt.ylabel(r'Probability density $|\psi|^2$')
plt.ylim(ymin=0, ymax=10)
plot, = plt.plot(xvals, np.zeros(len(xvals)))

def animate(frame):
  plot.set_ydata(N/2 * np.abs(frame.data_as('ndarray'))**2)
  return plot,

animation = FuncAnimation(fig, animate, frames=res.states, blit=True, interval=100)
plt.show()
```



### References

https://qutip.readthedocs.io/en/qutip-5.2.x/apidoc/solver.html

https://nbviewer.org/urls/qutip.org/qutip-tutorials/tutorials-v5/time-evolution/002_larmor-precession.ipynb

https://tobydriscoll.net/fnc-julia/bvp/diffmats.html

