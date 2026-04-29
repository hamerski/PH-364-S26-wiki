---
tags:
 - python library
 - plasmapy
---

## Plasmapy

I have chosen to use the library Plasmapy, and the module 'formulary.frequencies' within it. This library is useful for modeling plasma and calculating desired parameters. The documentation for this module can be found here: https://docs.plasmapy.org/en/stable/formulary/frequencies.html#module-plasmapy.formulary.frequencies. 

#### Functions
There are 5 functions in the frequency module, all of which are useful for calculating different frequencies relavent in plasma physics. I am currently taking a plasma physics class, so I chose a module that had functions I understood how/why they are used. The 5 functions in this module all calculate a different frequency, of which I have learned about 3. The 3 I know are `gyrofrequency()`, `plasma_frequency()`, and `upper_hybrid_frequency()`.

- The equation for the cyclotron frequency, also known as the gyrofrequency, is $$\omega_c = \frac{|q|B}{m}.$$ This represents the circular motion of a charged particle in a magnetized plasma. To use the function `gyrofrequency()`, it requires an input magnetic field value, B, a particle type, which can be anything from electron or proton, to an element (ionized or neutral), and a signed boolian value. If the signed parameter is left blank, it defaults to `False`, which means the particle will be positive. For example, for an electron, the function would look like `gyrofrequency(B, 'e-', True)`. Optional parameters include a charge number and mass number (if they are not specified by the particle parameter). It returns the gyrofrequency with units of radians per second.

- The equation for the plasma frequency is $$\omega_p=\sqrt{\frac{e^2n_e}{\varepsilon_0m_e}},$$ which represents the motion of the electrons in the plasma due to the internal electric field. The function `plasma_frequency()` requires an input particle density, n, and a specified particle. Again, the charge and mass numbers are optional. As an example, the function for an electron could look like `plasma_frequency(n, 'e-')`. It returns the plasma frequency in units of radians per second.

- Finally, of the frequencies I know, we have the upper hybrid frequency. This is related to the plasma frequency and the gyrofrequency by the equation $$\omega_{uh}=\sqrt{\omega_c^2+\omega_p^2}.$$ This is the frequency of particles in plasma when there is both an internal electric field and an external magnetic field. It is greater than the independent frequencies alone. The function `upper_hybrid_frequency()` takes the parameters from both the plasma and gyrofrequencies to calculate the upper hybrid. So, it need the magnetic field, B, and the electron number density, n_e. This returns the upper hybrid frequency with units of radians per second.

The two other functions are `Buchsbaum_frequency()` and `lower_hybrid_frequency()`. I don't know the physics behind these functions, but I will still explain the input parameters and what each function returns.

- The `Buchsbaum_frequency()` has inputs of the magnetic field, two particle densities for ions, and the two ions that make up the plasma. The charge numbers of both ions are optional parameters. As an example, this is how the function should look: `Buchsbaum_frequency(B, n1, n2, ion1, ion2, Z1, Z2)`. This function returns the Buchsbaum frequency with units of radians per second.

- The `lower_hybrid_frequency()` is related to the ions and the electrons within the plasma. The parameters are the magnetic field, the ion number density, and the ion type. If no charge is specified for the ion, the function assumes a singular charge. An example of this function is `lower_hybrid_frequency(B, n_i, ion)`. This function returns the lower hybrid frequency of the plasma in radians per second.