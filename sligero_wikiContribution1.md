Owen Sliger Week 1 Wiki Contribution

---
tags: 
- statistics
---

One important skill discussed in PH264 was statistical uncertainty and how closely a model is to a measured result. One method of comparing models and finding uncertainty is to calculate the Chi Sqaured of the model, which compares generated theoretical values for every variable of the model to the experimental values. This can be a useful tool when creating new models to test if they are a good representation of the properties we are trying to model. 

For example, if you suspect that your experiment can be modeled by an equation such as A*sin(phi), where A and phi are variables, and you wanted to see how close your model was to some measured phenomena, you would use the Chi Squared calculation in a nested for loop for both A and chi. Then, find the minimum chi squared and plot a graph to see how dependant each variable is. By calculating the reduced chi squared, a numerical value can be found that represents how close the minimum chi squared is to the real values.

Example of a nested for loop to calculate Chi Squared:

{
A = array
phi = array
sigma = uncertainty

for i in range(A.size):
    for j in range(phi.size):
        model = (A[i]*sin(phi[i]))
        chiArray=(measured_value - model)**2/sigma**2
        chiSq[i,j]=chiArray.sum()
}

Example of the reduced chi squared to determine if the theoretical model is a good fit:

{
rejectmodel = chiMin/(number of measurements - degrees of freedom)
}