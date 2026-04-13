Numerical Modeling of Exponential Decay

One of the biggest concepts in computational physics is using numerical methods to create models for physical systems,
especially when it is hard to work with actual experimental data, or solutions are too analytical. A key thing I learned from 
PH 264 is fitting different kinds of models to data, and extracting paraneters from them. An important example is exponential
decay, which shows up in radioactivity, capacitors discharging, and it can also happen in astrophysics a lot.

The physical model for exponential decay is: N(t)=N_0 e^(-lambdat), where N(t) is the quantity at time t, N_0 is the intial 
quantity, and lambda is the decay constant. Most of the time in real life, we do not know lambda already, so we have to find it
by using data. 

To analyze this data, the general steps are, collecting measurements with uncertainty, finding a model based on the theory, 
comparing the model to the data, and then adjusting the parameters to find the best fit. This all ends up being called model 
fitting. 

Example: 

import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

t=np.array([0,1,2,3,4,5])  #random example data
counts=np.array([100,80,65,50,40,30])

def model(t,N0,lam): #defining exponential model
    return N0*np.exp(-lam*t)

params,cov=curve_fit(model,t,counts,p0=[100,0.2]) #fitting the model
N0_fit,lam_fit=params

plt.scatter(t,counts,label="Data") #plot results
plt.plot(t,model(t, N0_fit,lam_fit),label="Fit")
plt.xlabel("Time")
plt.ylabel("Counts")
plt.title("Exponential Decay Fit")
plt.legend()
plt.show()

This shows us how the model comes directly from the equations. The curve_fit gives the values of N_0 and lambda that match the
data the best. The plot then let's us see how well the model fits the data visually. So, computation allows us to find some 
useful parameters from measurements. 

This is important and relevant because it translates equations into code, works with real data, uses numerical techniques, as
well as looks at actual results to see the physical meaning. These are very useful skills in physics I think, especially in 
astrophysics research where exact numerical solutions are not always found. 