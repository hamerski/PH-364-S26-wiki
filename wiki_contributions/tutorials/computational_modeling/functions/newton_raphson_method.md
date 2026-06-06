---
tags:
- Numerical Methods
- Functions
---


## Code Review: Newton-Raphson Method, Kepler's Equation and Functions

The Newton-Raphson Method (sometimes also just called "Newton's Method") is a powerful iterative tool that can help to solve equations that are otherwise analytically unsolvable. The form of the Newton-Raphson Method is as follows: $$ x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$

The way this method works is by sequentially drawing tangent lines at certain points of the function, starting at an estimate of where the root is. The initial estimate (and sequential estimates during further iterations) of the root is reflected in the equation as $x_n$. The sequential guesses of the root will typically converge when the true root has been reached or when the specified tolerance has been reached.

## Newton-Raphson Method in My Final Project

There are many different kinds of functions that are not able to be solved analytically. The Newton-Raphson Method is useful for nonlinear equations and transcendental functions specifically. An example of this is Kepler's Equation, a trancendental function which is used to determine the eccentric anomaly "E": $$M = E - esin(E)$$

where $M = \frac{2\pi(t - T)}{P}$. 

In my project, the goal was to determine the eccentric anomaly for every planet in the solar system so that their orbital trajectories could be modeled over time. The eccentric anomaly operates in a Keplerian orbit very similar to how $\theta$ works in the unit circle, where "E" will define the angular position of the planet.

Referring back to the Newton-Raphson Method:
- $x_n = M$
- $f(E) = E - esin(E) - M$
- $f'(E) = 1 - ecos(E)$

Naturally, the function that we are attempting to approximate rearranges Kepler's Equation so that M is on the right hand side and the whole function is equal to zero. Making the initial guess that $x_n = E$ is a logical place to start because the initial Kepler Equation states that $M = E - esin(E)$. For any other function, generally finding a constant that can be approximately equatable to the root is a good guess. "M" stands for the mean anomaly, which is a fraction that describes the amount of the elliptical orbit that has been travelled since the body last passed its periapsis (or in our project's case, the perihelion). The periapsis is the part of the orbit where the orbiting body is closest to the orbited body. The perihelion is the periapsis, but specifically for the sun.

***

## Defining the Function(s)

#### Kepler Equation

The following code is taken straight from my final project, where my groupmates and I created our own functions to solve the Kepler Equation using the Newton-Raphson Method. Defining the function yourself is difficult and requires you to understand the physical system and its implications well. I will break down how this manifests in my project.

Below, I define a function: `solve_kepler`. This equation is where the Newton-Raphson Method is explicitly defined. It relies on the following variables:
- E: Eccentric anomaly
- e: Eccentricity
- E_new = Iterative guess of the eccentric anomaly
- M: Mean anomaly

It is important to remember that "E" and "e" are two different things. Where "E" defines the eccentric anomaly - and therefore the angle of the orbiting body - "e" is the eccentricity. The eccentricity describes the amount that the orbital trajectory has deviated from a perfect circle. Furthermore, the eccentric anomaly is a value that is varied over time, whereas the eccentricity (in our model) is not. In truth, the eccentricity does also vary over time, however this is also quite difficult to calculate and is therefore neglected in our model.

An important part in the following code is the if statement: `if np.max(np.abs(E_new - E)) < tol: return E_new`. This block of code allows the function to terminate when the iteration has reached a root that matches the desired tolerance. As I described previously, the Newton-Raphson Method's calculated roots will converge when either the true root is reached or when the specified tolerance has been achieved. The if statement fulfills the second condition. Given that the Newton-Raphson Method is just an approximation, it is not pertinent that the *exact* value of E is retrieved.

`def solve_kepler(M, e, tol = 1e-12):

    E = M.copy() # duplicates M so that the original list is not modified

    # iterate the Newton-Raphson Method until an approximation of E is determined
    for i in range(10):

        f = E - e*np.sin(E) - M # original function f(E)

        fp = 1 - e*np.cos(E) # derivative of f(E)

        E_new = E - f/fp # E_new is the true root of E

        if np.max(np.abs(E_new - E)) < tol:
            return E_new

        E = E_new

    return E`

#### Initial Eccentric Anomaly

It may seem counterintutive that the previous equation was not sufficient to calculate the eccentric anomaly. The reason for this is that we have to look very far into the future to actually calculate the eccentric anomaly. What I mean by this is that we need to know what the initial eccentric anomaly is to be able to calculate the mean anomaly. Which is then needed to calculate the eccentric anomaly over time. It seems a bit like circular logic, but when you are trying to understand an orbit over time, it is prudent to define a starting point.

The following function defines how to calculate the initial eccentric anomaly. The first two variables: `cosE` and `sinE` come from the coordinate pair that accepts "E" and calculates x and y values for the orbit to be graphed. Those coordinates are then rearranged to find: $$x = a(cos(E) - e) \Rightarrow cos(E) = \frac{x_0}{a} + e$$ $$y = a\sqrt{1-e^2}sin(E) \Rightarrow sin(E) = \frac{y_0}{a\sqrt{1-e^2}}$$ where:
- a: Semi-major axis
- $x_0$: Initial x-coordinate
- $y_0$: Initial y-coordinate

The two values `cosE` and `sinE` are then passed into Numpy's `arctan2` function. This function allows me to determine what the initial orbital angle is based off of the initial x,y coordinates. It is important to use an `arctan2` function rather than an `arctan` function because `arctan2` will preserve the location of the planet in quadrants 3 and 4 on a graphing axis. Conversely, `arctan` will only be able to compute values for the first and second quadrants.

Following this is another if statement block: `if E0 < 0: E0 += 2*np.pi`. Given that a planet is travelling on an ellipse, the angle must be normalized such that when the planet is less than 0, it is multiplied by a factor of $2\pi$.

`# DETERMINE INITIAL ECCENTRIC ANOMALY

def initial_E(x0, y0, a, e):

    # rearrange x and y coordinate equations to directly solve for cos(E) and sin(E)
    cosE = x0/a + e

    sinE = y0/(a*np.sqrt(1-e**2))

    E0 = np.arctan2(sinE, cosE) # determine the initial angle for each planet

    if E0 < 0: # normalizes E_0 so it is always positive (if E_0 is already positive, skip this block)
        E0 += 2*np.pi

    return E0`

#### Final Eccentric Anomaly

In our original code, the function `orbit_position` is named as such because it does more than just returning the value "E" again. It takes the calculated "E" and then finds the x and y coordinates of the planet. However, in this code review, we just care how to find E. As I mentioned in the previous section, we have to be able to see the full picture of where our code is leading. That idea comes to fruition in this code block because we must use the initial eccentric anomaly to calculate the initial mean anomaly: $$M_0 = E_0 - esin(E_0)$$

This formula is just the "initial" version of the Kepler Equation I defined previously. We use $M_0$ to calculate $M$ itself by multiplying $M_0$ by n and t: $$M = M_0 * nt$$ where:
- n: Velocity
- t: Time

We still cannot stop here with M, however. There is one last thing I have to do to make sure the proper M is being passed that will result in an elliptical orbit. This can be done using `np.mod` which, in this example, will divide our M array by $2\pi$. This conserves the elliptical shape of the orbit instead of letting the planet "drift off into space". In the comments, I mention that we must make sure that "M does not 'blow up'" which essentially carries the same meaning.

Finally, we can calculate E for real. I use the `solve_kepler` function I previously defined and pass values of "M" and "e" to it. Now all that is left to be done is to call the functions.

`# COMPUTE ORBIT POSITION

def orbit_position(t, a, e, period, E0):

    M0 = E0 - e*np.sin(E0) # substitutes E_0 for E to find the initial mean anomaly (aka mean anomaly at epoch)

    n = 2*np.pi/period # determines the velocity of each planet

    M = M0 + n*t # calculate M by adding mean anomaly at epoch to the velocity

    M = np.mod(M, 2*np.pi) # orbits are periodic, so divide M by 2*pi so M does not "blow up"

    E = solve_kepler(M, e) # solves eccentricity

    return E`

#### Calling the Functions

For the purposes of this code review, I want to just find the eccentric anomaly of Earth after it completes one orbit around the sun. If I wanted to determine multiple values of the eccentric anomaly, I would use a for loop instead to iterate over multiple values of "t". Additionally, if I wanted to find more than one planet, I could use another for loop to iterate over a dictionary of planets. This is how we did it in the final project.

I only call the functions `initial_E` and `orbit_position` because the `solve_kepler` function is already called within `orbit_position`. I can specify my x0, y0, a, e, t, period, and E0 values based off of which planet I am trying to analyze. Changing the "t" parameter allows me to adjust what year I want to see the eccentric anomaly for. Currently, as my t is set to 1, I can see the orbital anomaly of the Earth after 1 full orbit. The returned value is approximately 2 radians. It may seem confusing why, after one full year, the planet is not at "0 radians". This is because the specified coordinates are not at 0 radians, so the planet is simply stopping where we told it to begin.

`E0 = initial_E(x0 = -0.1773487970879621, y0 = 0.9622255911830275, a = 1.000, e = 0.0167)
E = orbit_position(t = 1, a = 1.000, e = 0.0167, period = 1.000, E0 = E0)

print(E)`

Returns: 1.736203308404034

***

## Sources

Newton-Raphson Method:
- https://web.mae.ufl.edu/uhk/PLANETARY-MOTION.pdf
- https://pwg.gsfc.nasa.gov/stargaze/Smotion.htm
- https://personal.math.ubc.ca/~cass/courses/m309-01a/orbits.pdf

Data:
- https://ssd.jpl.nasa.gov/horizons/app.html#/

Code:
- Group 3: Cy Acosta, Stephanie Poole, and Baining Yu