---
tags: 
 - QuTip
 - Quantum Mechanics
---

QuTip involves quantum systems, the first module can set-up the quantum systems, as well as do things like solving for the commutator, it can transpose a matrix, find the eigenvalues, eigenstates, find the norm, take the adjoint, and much more. To show the usefulness of this module I chose to show it setting up a quantum system.

import numpy as np
import matplotlib.pyplot as plt
from qutip import *

#Establish the quantum system to have four basis states, as well as setting angular frequency and hbar to simple values for easy modeling.
n = 4
omega = 1.0
hbar = 1.0


#Setting psi0 as a basis ket for a ground state.
psi0 = basis(n,0)

#Creating Hamiltonian
N = num(n)
H = hbar*omega*(N + 0.5)

#Display the created ket vector, the number operator, and the hamiltonion operator.
print("\nNewly Created Ket Vector\n", psi0, "\n")
print("Number Operator\n", N, "\n")
print("Hamiltonian Operator\n", H, "\n")

#Finding and displaying eigenvalues/ possible measurements and eigenstates.
energies = H.eigenenergies()
energyStates = H.eigenstates()
print("Energy Eigenvalues\n", energies)
print("\nEnergy Eigenstates\n", energyStates)

#Set up variables to show the expected energy values, versus the realistic discrete energy values.
n_values = np.arange(n)
expected = hbar*omega*(n_values + 0.5)

#Plot these data points
plt.plot(n_values, energies, "o", label="QuTip Energies")
plt.plot(n_values, expected, label="Expected")
plt.xlabel("Quantum Number n")
plt.ylabel("Energy")
plt.title("Quatum Harmonic Oscillator Energy Eigenvalues")
plt.legend()
plt.grid()
plt.show()

You can see in the code above that I chose to examine a Harmonic Oscillator system. The first thing I did, which was mainly to demonstrate the usefulness of setting up a system is setting psi0 as an eigenstate/ basis vector, and displaying it to show that QuTip automatically describes your chosen quatum object, and for this situation arranges it in a ket vector. The next thing I did was create a number operator using the num function in QuTip and display that to show how QuTip can properly create an operator matrix efficiently using its built in commands. Then I set up a Hamiltonian using function from this module in QuTip, like the number operator. I displayed all this information and labeled it for easy reading, as well as used a function in this module to actually calculate the energy eigenvalues of this Hamiltonian, as well as the eigenstates. Since the eigenvalues of a diagonal matrix are the diagnol, we can see that the function calculated the eigenvalues well, as well as displayed the eigenstates we'd expect from this diagonal Hamiltonian. When we plot a continuous, nonrealistic, expectation for the energy eigenvalues, as well as the energies QuTip calculated, we can see this trend is consistent with our expectations.

Overall, this module is a great help to setting up quantum systems and performing operations. The quantum objects that this library creates are pre-built to properly function as a ket vector, a full matrix operator, it displays the information regarding these very well, and it has a number of functions to create shortcuts for some of the common operators/ functions we would need to use. I didn't use it in this problem, but we can calculate the commutator, we can transpose, adjoint, conjugate, find the norm, use the identity matrix, create position or momentum operators, and much more. When looking at other modules I saw one that has a function for calculating expectation values, so QuTip can suit the needs of many quantum systems and modeling. This library has potential for vastly more complicated systems then the one I created.
