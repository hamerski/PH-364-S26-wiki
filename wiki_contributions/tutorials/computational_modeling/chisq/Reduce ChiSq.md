---
tags:
 - model fitting
 - chi-squared
---

The main concepts in computational phsyics is being able to develope and construct a model that supports our claims or ideas of physics. For example in PH264 we covered many different ways to determine if a model supports our data or not. This was mainly done by using chisq values and lots of statistics. Statistics as a whole is a very important skill for physics. Thermodynamics is essistially built off of statistics (if i remember properly). This is done by using the chisq value equation and using the stantard error of each of independent varriables. From there we can use a calculator to determine the probabilies to see if the model is accurate or not. To go further we can also use the reduced chisq value equation, which is the like the goodness of a fit the equation being chisq/dof. If we get a reduced chisq value close to 1 then our model fits well if not close then the model is regeted. This is nice when plotting a given model to experimental data to see if our models does indeeed fit the data or not. Example for radiatice decay if I create a model using a linear fit we expect a really large reduced chisq value but know if we use a exponetial fit then the model results in reduced chisq value of 1 meaning the model is in agreement. See Chi-squared minimization for an example

Testing the validity of models is quite important. It allows us to find models that can represent real world
phenomena. In order to test the validity of a model we use something called the Reduced Chi^2.

In order to calculate the Reduced Chi^2 we first take the Chi^2: 
sum of (each observed data point - the model with our guess)^2/(uncertainty of the data point)^2

The minimum value of Chi^2 is taken and then divided by the number the observed data points - the degrees of freedom

The degrees of freedom is the number of parameters you are changing. 

The result of these calculations is the Reduced Chi^2. 

An example of testing a model is for 5 temperature readings with uncertainty 0.5 degrees.

import numpy as np

temp = [12, 15.5, 18.7, 20.9, 24]
time = [0, 1, 2, 3, 4]
uncert = 0.5

guessSlope = np.range(0, 5, 0.1)

intercept = 12

chiSq = np.zeros(5)

for i in range(0, 5):
	chiSq[i] = np.sum((temp - (guessSlope[i]*time+intercept))^2/uncert^2)

chiMin = np.min(chiSq)

redMin = chiMin/(temp.size-1)

If the result of the Reduced Chi^2 is small (0.8-1.2), then the proposed model is a good fit.
	
