---
tags:
- statistics
- chi-square
- modeling
---

## Explanation

This contribution discusses the use of chi-squared and reduced chi-squared in evaluating how well a model fits data. The chi-squared value measures the difference between observed data and model predictions, while the reduced chi-squared accounts for the number of data points.

A reduced chi-squared value close to 1 indicates a good fit, while values much larger than 1 suggest that the model does not describe the data well.

I already know some basic computational models for physics. In PH 264, we learned about lots of (what I'm assuming to be relatively basic) statistical models, such as Gaussian distributions, Poisson distributions, and some general probability density definitions. I would say we spent a long time learning about different kinds of error and uncertainty, and how we can use them to possibly reject a model. 

One example of this is the chi square and reduced chi square. Although I am still a little shaky on this concept, I know that a reduced chi square of close to 1 means that the data and the model are in agreement. By minimizing the chi square, we can get the best estimate for model parameters for a given set of data.

We also coded models to visualize chi squareds. With one variable, this is a plot of a quadratic chi squared with respect to posible values of a variable. With two variables, this turns into a contour plot, and we can marginalize over one variable to determine the best value of the other.
