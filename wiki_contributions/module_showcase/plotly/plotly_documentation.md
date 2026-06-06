---
tags:
- tree documentation
- animation
---
# Tree Documentation and Animating in Plotly

&emsp;&emsp;In class, we focused on plotting and modeling figures in matplotlib, but for our final project, my group and I decided to use the plotly library to create animations. Plotly's main appeal to me is its terseness, espically comparing to matpltlib, which I often get annoyed at writing "plt." every line. Once you make it over the large learning curve to understand how the syntax works, you can create nice looking code. As for the figures, it's express submodule can create aesthetically appealing plots in nearly two lines of code.  All of the figures are interactive, so a user can hover over data points or zoom in on a specfic section of a plot.  This ability comes in handy for data analysis and public presentations, or if the figure will be dislpayed on a website.  It has also shown itself to load animations faster than matplotlib. The biggest downside is the learning curve, this is the style of code that scares me.  It can also have less customization than matplotlib.  I personally find the animation makes more sense with plotly, so I would reccomend for animations if you're willing to spend time reading and playing with the code.

&emsp;&emsp;Plotly uses a syntax called tree documentation, which I would describe as going on a Wikipedia deep dive, with the topic becoming increasively niche as time goes by. You call an initial function, `go.Figure`, as an argument in which you input `data`, you want the data to be presented as a `go.Scatter` plot, with a given x and y array with points marker size and color, etc. An example code seen in the code below: 

```python  
import numpy as np
import plotly.graph_objects as go

t = np.linspace(0,2*np.pi, 100)
y = np.sin(t)

fig = go.Figure(data=go.Scatter(x=t, y=y, mode='lines',line=dict(color='deeppink',width=3,)))

fig.show()
```

&emsp;&emsp;`Go.Figure` is a function within plotly that renders a figure with the given arguments.  Plotly calls `Data` an attribute, it one of the three main inputs, the other two being `layout` and `frames`.  Within attributes, you design your graph.  `Data` is where you input and edit your data points, in `layout`, the background of the graph is created, and in `frames` any animation is performed.  You then call on different parameters, which can also include parameters themselves.  Typically, lines are indented by 1 every new parameter and lists can be written on different rows.  Outside of defined figures, updates such as `update_traces` or `add_shape` can be written as a standalone chunk of code.

&emsp;&emsp;In my group project, we needed to animate masses based on a hamonic oscillator.  We were reccomended to use plotly for animations.  The following block of code will produce multiple frames back to back of a point in different locations on a ring.

```python
theta = np.arange(0,2*np.pi,0.1)
X = np.zeros(theta.size)
Y = np.zeros(theta.size)

#creating frames 
frames = []

for i in range(theta.size):
    X[i] = np.cos(theta[i])
    Y[i] = np.sin(theta[i])
    
    frames.append(go.Frame(      #adding frame[i] to frame[i-1]
        data=[go.Scatter(        #input data x and y points
            x=[X[i]], 
            y=[Y[i]], 
            mode="markers",      #want points to be represented as a point    
            marker=dict(         #will use two marker attributes, can set marker=dict() to edit multiple properties without having to recall marker
                size=10, 
                color="deeppink"))]))
```

&emsp;&emsp;First, the frames need to be created, this is done by setting `frames=[]`.  In the for loop, the actual animation is performed, frames with a single point on varrying locations on a ring is plotted.  `Frames.append` tells plotly to append the graphing objects frames back to back.  From there, we move to the next line an indent as we input the data.  The data is plotted as a scatter plot, to input data and edit the points, another we move to the next line, making another indent as we go.  You will see the `x`, `y`, `mode`, and `marker` parameters are all on the same indentation level, but there is a further indentation for `size` and `color`.  This further indent is because we have "opened the dictionary" of `marker` and are editing multiple parameters inside the "dictionary".  At the end, a list of frames is created, each with information telling a figure how to update overtime. You may also notice, as the layer of number of parameters increases, another set of parenthesis is added. 

This can be quite confusing, but let's look at producing the figure:

```python
fig = go.Figure(           #create figure
    data=[go.Scatter(      #input data and edit data points
        x=[X[0]],
        y=[Y[0]],
        mode="markers", 
        marker=dict(
            size=10, 
            color="deeppink"))],
    layout=go.Layout(     #edit background and graph axes
        xaxis=dict(
            scaleanchor="y", 
            range=[-1, 1]),
        yaxis_range=[-2, 2],
        title="Particle Moving on Circle",
        font=dict(
            family="Georgia",
            size=15),
        updatemenus=[dict(  #list of parameters used to modify plot
            type="buttons", #update menu with a button
            buttons=[dict(  #button is also a list, here we select what the button does and how it looks
                label="Play", 
                method="animate", 
                args=[None,{"frame": {"duration": 50}}])])]),  #arguments sent to method when button is clicked
    frames=frames)
```

&emsp;&emsp;Here, you can see the indentation in the full process. The data contains the x and y values for the initial frame, which will be plotted as a deep pink point with marker size 10.  The x-axis has range -1,1, etc. The phrase `updatemenus` is new, this controls any modification to the data and layout.  There is also something to note about `updatemenus`; it is a list.  I am unsure why plotly labels certain properties as lists, but when it does, you need to include a set of brackets around everything within that list.  The same is true with `buttons`.  Within `updatemenus`, the method to start modification is by pressing a button.  The button is made to say "Play" and will start animation.  Arguments tell the plot how to animate: by passing in the frames created for animation in the previous block, each lasting 50 milliseconds.

&emsp;&emsp;We could end here, but in our project, we wanted to show our masses oscillated in a confined ring.  As mentioned prior, updates can be made outside of the main attriutes (`data`, `layout`, `frames`).  A circle was added to the figure using `add_shape`.  It's x and y maximum/minimum values were input, along with the appearance, and even what layer it would appear on in the figure.  We can now see a point moving along a circle, and if the play button is pressed more than once, you can see a seamless transition between the finial and inital frames.

```python
fig.add_shape(
    type="circle",
    x0 = -1, y0 = -1, x1 = 1, y1 = 1, 
    line=dict(
        width=4, 
        color="darksalmon"), 
    layer="between")

fig.show()
```