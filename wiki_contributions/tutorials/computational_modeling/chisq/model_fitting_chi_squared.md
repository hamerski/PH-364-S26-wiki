---
tags: 
 - model fitting
 - chi-squared
 - statistics
---

The main concepts in computational phsyics is being able to develop and construct a model that supports our claims or ideas of physics. For example in PH264 we covered many different ways to determine if a model supports our data or not. This was mainly done by using chisq values and lots of statistics. Statistics as a whole is a very important skill for physics. Thermodynamics is essistially built off of statistics (if i remember properly). It is pretty relevant to computational physics and what we will likely be using computational physics for in this class as well as in possible future physics careers.

This statistical analysis is done by using the chisq value equation and using the standard error of each of independent varriables. From there we can use a calculator to determine the probabilies to see if the model is accurate or not. To go further we can also use the reduced chisq value equation, which is the like the goodness of a fit the equation being chisq/dof. The reduced chi^2 value uses the chi^2 value which is calculated using "a weighted sum of squared deviations" (Wikipedia, 'Reduced chi-squared statistic') for the different values measured and errors associated with them. The reduced chi^2 value is chi^2 per degrees of freedom of the system; often the number of data points minus the number of parameters of the system. 

If we get a reduced chisq value close to 1 then our model fits well. If not close then the model is rejected. Models from 0.8 - 1.2 reduced chi^2 values will generally show correlation with the experimental data. Numbers much, much larger than 1 for a reduced 
chi^2 value mean that the model does not correlate to the data and cannot be used to draw conclusions about the behavior of the measured system.This is nice when plotting a given model to experimental data to see if our models does indeeed fit the data or not. Example for radiatice decay if I create a model using a linear fit we expect a really large reduced chisq value but know if we use a exponetial fit then the model results in reduced chisq value of 1 meaning the model is in agreement.
