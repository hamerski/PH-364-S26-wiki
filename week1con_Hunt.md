---
tags: 
 - model fitting
---
Something that I already know about computational physics that I learned in PH 264 is its uses for comparing fit of models by way of checking the
reduced chi^2 value of a given theoretical fit to the experimentally collected data. Comparing fit of different models to experimental data seemed 
to be the big takeaway from PH 264, so I think that it is pretty relevant to computational physics and what we will likely be using computational
physics for in this class as well as in possible future physics careers. The reduced chi^2 value uses the chi^2 value which is calculated using "a 
weighted sum of squared deviations" (Wikipedia, 'Reduced chi-squared statistic') for the different values measured and errors associated with them. 
The reduced chi^2 value is chi^2 per degrees of freedom of the system; often the number of data points minus the number of parameters of the system. 
A reduced chi^2 value closer to one means the model fits the data better, and one further away from one means it fits the data worse. In my experience,
models from 0.8 - 1.2 reduced chi^2 values will generally show correlation with the experimental data. Numbers much, much larger than 1 for a reduced 
chi^2 value mean that the model does not correlate to the data and cannot be used to draw conclusions about the behavior of the measured system.

