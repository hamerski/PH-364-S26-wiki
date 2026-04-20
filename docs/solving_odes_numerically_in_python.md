---
tags: 
 - ode
 - numerical methods
 - differential equations
 - numenrical integration
 - scipy
---

# Solving ODEs Numerically in Python

SciPy is a powerful library in Python that allows us to solve ordinary differential equations (ODEs) or systems of them numerically with the functions that it provides. 

## Initial Value Problems (IVPs)
We can use the function `scipy.integrate.solve_ivp` to solve a system of $n$ ODEs in an initial value problem, and think of solving a single ODE as a special case where $n = 1$. Furthermore, we will only demonstrate with a first-order system of ODE, since any higher-order system of ODEs can be transformed into a first-order system through change of variables. 

Let $\mathbf{y}(t)$ be an $n$-dimensional vector-valued function that depends on the independent variable $t$. Then, an IVP for a system of ODEs can, in general, be written as
$$
   \frac{d}{dt} \mathbf{y}(t) = \mathbf{F}(t, \mathbf{y}(t)) \\
   \mathbf{y}(t_0) = \mathbf{y}_0 \,,
$$
where $\mathbf{F}(t, \mathbf{y})$ is an $n$-dimensional vector-valued function that describes the behavior of $\mathbf{y}$ through its derivative, and $\mathbf{y}_0$ is a constant given by the initial condition at time $t_0$. 

To use the function `scipy.integrate.solve_ivp`, we first need to write $\mathbf{F}(t, \mathbf{y})$ in Python as a function with the signature `fun(_, _)` where the first slot is a scalar that corresponds to $t$, and the second slot is a scalar or array that corresponds to $\mathbf{y}$. Moreover, `foo` must return a scalar or an array in the same shape as the second argument. 

The syntax of `scipy.integrate.solve_ivp` is `solve_ivp(fun, t_span, y0)`, where `fun` is the callable object that we just contructed to represent $\mathbf{F}$. `t_span` is a length-2 array `[t0, tf]` where `t0` represents $t_0$, and `tf` is where the numerical integrates until. As such, a solution found by the `scipy.integrate.solve_ivp` is also constrained to this interval. Lastly, `y0` is a scalar or an array representating $\mathbf{y}_0 = \mathbf{y}(t_0)$, our initial value. Note that `y0` must have the same shape as the second argument and return of `fun` (i.e., have a length of $n$). 

There are more optional variables that we can pass into the function, which can configure the solver/integrator used "under the hood", step size, etc. 

Using this function, our return is a bunch object that has fields such as `t`, an array of the independent variable, and `y`, an array of the output of our vector-valued function in question. To access the fields of a bunch object in python, we can use the syntax `sol.t`, where `sol` is the return of `scipy.integrate.solve_ivp`. 

Here is a code example from the official documentation:
```python
import numpy as np
from scipy.integrate import solve_ivp
def exponential_decay(t, y): return -0.5 * y
sol = solve_ivp(exponential_decay, [0, 10], [2, 4, 8])
print(sol.t)
print(sol.y)
```

To find out more about this function and its usage, including more code examples, see the [documentation](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.solve_ivp.html).

