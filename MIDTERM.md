title : Using QuTip for Tensors 
tags: [Qutip, tensors]


The qutip libary is used for simulating quantum systems. Since quantum systems a very abstract is can be hard visually concepulatize it and the mathamtics can also get very intense at times such that simple operation in python cant solve it or it makes a big mess as a whole. This is whatt qutip is meant for being able use operation commononly used in the quantum world and be able to create simulations such that one is able to conceptualize this ideas better.

For what I have done is a simple step working towards a completed model which is starting with the Hamiltonian. I will not dive into the theory behind it.

The module that I would like to focus on is the tensor. A tensor is mathmatical object that generalizes scalers, vectors, and matrices to describe mutidirectianal properties. Not only does this model help us describe many physical models such as the Dicke Model its commonly used in many other fields of phsyics and is a important mathmatical skill to know. what is inside the tensor are forms of list or arrays in this case quantum objects for the tensour product. In return the tensor then spits out a composite quantum object.

Above I have provided a code which disiplays the Dicke hamilatonian. This still doesnt give me a deep understanding of what exactly the it does but, at times i find it easier to see a hamilatonian as a matrix which can help me point out key features that are present. In this case when working with code I know that sometimes working wiht a matrix makes it alot easier to solve problems compared to using equations and in this case that is what we want to do. Looking foward into the tutorial we use this matrix to calculate things like probabilities. There a other models that are used in the tensor, but I would not go into those.

Overall tensors are a crucial mathmatical skill and qutip has provided a way to make this process easier when dealing with quantum systems.

LINKS

turorial https://nbviewer.org/urls/qutip.org/qutip-tutorials/tutorials-v5/lectures/Lecture-3A-Dicke-model.ipynb

module https://qutip.org/docs/4.0.2/apidoc/functions.html#module-qutip.tensor