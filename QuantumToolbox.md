----
tags:
 - Numerical Methods
----

Overview of QuTip:
Though I think there is a lot to unpack with this library, Qutip is a "Quantum Toolbox" library for Python code. It is designed specifically for quantum systems, providing essential tools to properly represent quantum systems and states, to define operators and execute them correctly, and especially to solve time exolution problems. The module I explored is the qutip.solver module, and specifically I wanted to experiment with the function sesolve(). This function is used for solving unitary time evolutions for time-independent and -dependent Hamiltonians. The function also allows us to define a Hamiltonian, specify an initial quantum state, and compute how the system evolves over time. This is directly relevant to quantum mechanics (and thus physics) as physicists frequently solve the Schrodinger equation, which sometimes cannot be solved analytically. Ultimately, this was a really exciting library to discover and explore and it also captures how computational physics keeps up with theoretical and experimental physics.

Example: How a quantum particle in a 1D infinite potential well behaves over time. 

#Step 1: Imports and Setup
import numpy as np
import matplotlib.pyplot as plt
from qutip import *

#Step 2: Define System Parameters
N = 100                               #N=number of spatial grid points
x_max = 10                            #size of the box
x = np.linspace(0,x_max,N)

dx = x[1] - x[0]

#Step 3: Hamiltonian
diag = np.ones(N)
off_diag = np.ones(N-1)

T = (-1/(2*dx**2)) * (np.diag(diag* -2) + np.diag(off_diag,1) + np.diag(off_diag,-1))

#Step 4: Convert to Qobj
H = Qobj(T)

#Step 5: Define the initial wavepacket
x0 = x_max / 2
sigma = 0.5

psi0_array = np.exp(-(x - x0)**2 / (2*sigma**2))
psi0_array = psi0_array / np.linalg.norm(psi0_array)

psi0 = Qobj(psi0_array)

#Step 6: Time Evolution
tlist = np.linspace(0, 2, 100)

result = sesolve(H, psi0, tlist)

#Step 7: Graph
for i in range(0, len(tlist), 20):
    psi_t = result.states[i].full().flatten()
    prob = np.abs(psi_t)**2
    
   plt.plot(x, prob, label=f"t={tlist[i]:.2f}")

plt.xlabel("Position")
plt.ylabel("Probability Density")
plt.title("Time Evolution of Wavefunction in a Potential Well")
plt.legend()
plt.show()



Code Walkthrough:

Step 1: 
numpy - handles arrays and calculations
matplotlib.pyplot - plots graphs
qutip - quantum toolbox

Step 2:
N is the number of grid points in space
X_max is the size of our box
np.linspace creates N evenly spaces points in the box. 
dx is for spacing between grid points (similar to infinite difference method)

Step 3:
Here we are building the kinetic energy operator. 

diag = np.ones(N) - creates [1,1,1,...1]
np.diag(diag * -2) - puts -2 on the main diagonal
off_diag = np.ones(N-1) - for neighboring points
np.diag(off_diag,1) - puts 1's on the upper diagonal
np.diag(off_diag,-1) - puts 1's on the lower diagonal
(-1/(2*dx*2)) - multiplied to make the finite difference

Step 4: 
H=Qobj - converts matrix into a quantum object. QuTip class sesolve() only works with quantum objects

Step 5: 
x0 - center of the wave packet
sigma - width of the wave packet
psi0_array = psi0_array / np.linalg.norm(psi0_array) - Normalizes

Step 6:
tlist - times for desired solutions
**sesolve - Solves the Schrodinger eq. and gives you a wave function at each time**
result.states - list of wavefunctions at each time

Step 7:
for i in range(0, len(tlist), 20): - skips through some times to avoid plotting 100 lines
psi_t = result.states[i].full().flatten() - converts quantum object (Qobj) into numpy array
prob = np.abs(psi_t)2 - computes probability density


