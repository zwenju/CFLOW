#!/usr/bin/python
import sys
import os 
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.tri as tri 
import math 
# *********************************************************************************
# Date : 04/11/2017
# Author : Wenju Zhao 
# Purpose : this routine intends to replace the showme software to display the triangulation
# ********************************************************************************** 
#
# read the mesh file name from the command line
#
# ex: ./triangle_showme  mesh_file_name 
# 
acommand_line_args = str(sys.argv[1])
print (acommand_line_args) 

mesh_file_name = acommand_line_args 





fig_x_axis_size_inches = 2.2  * 10 
fig_y_axis_size_inches = 0.41 * 10 




#
# concatenate the node and element files with suffix 
#
node_file = mesh_file_name + ".node"
element_file = mesh_file_name + ".ele"
#
# using numpy to load the nodelist and element list 
#
NodeList    = np.loadtxt(node_file)
ElementList = np.loadtxt(element_file)
#
# set x,y points for the matplotlib.triplot
#
x = NodeList [:, 1] 
y = NodeList [:, 2]  
xy_label = NodeList [:,3].astype(int)

#
# set the plot figure size 
#
max_x =  np.amax(x, axis=0) 
min_x =  np.amin(x, axis=0) 

max_y =  np.amax(y, axis=0) 
min_y =  np.amin(y, axis=0) 
scale = 8
fig_x_axis_size_inches = scale * ( max_x - min_x ) 
fig_y_axis_size_inches = scale * ( max_y - min_y )

#
# to match the python  the 0-index of the element (1:3) by substracting 1
# the vertex points 
triangles1 = ElementList [:, 1:4] - 1
# the midpoints per element
triangles2 = ElementList [:, 4:7] - 1

# link together 
triangles = np.concatenate ( (triangles1, triangles2), axis=0 ) 

# transform real to int 
triangles1 = triangles1.astype(int)
triangles2 = triangles2.astype(int)
triangles  = triangles.astype(int)


fig = plt.figure(1) 
ax = fig.add_subplot (111)

#plt.gca().set_aspect ('equal')
# plt.triplot(x, y, triangles ) 

#
# plot the triangles by link the mid-points per elements 
#
plt.triplot (x, y, triangles2, 'ro--', linewidth = 0.2)
#
# plot the triangles by link the vertices points 
#
plt.triplot (x, y, triangles1, 'bo-', linewidth=1)

#
#  add the label for each node from 1 to NodeNum
#

for i in range(0, x.size):
    ax.annotate (i+1, (x[i],y[i]))

#
# add the label for the elements using their barycenter 
#
 
for i in range (0, int( triangles[:,0].size / 2 )) :
    indx = triangles[i, 0:3] 
    xc = np.sum( x[ indx ] ) / 3.0 
    yc = np.sum( y[ indx ] ) / 3.0 
    ax.annotate( i+1, (xc,yc) )

#
#  add X-Y coordinate label 
#


plt.title('Triangulation with indices of Nodelist and Elementlist')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

fig.set_size_inches (fig_x_axis_size_inches,  fig_y_axis_size_inches)
fig.savefig(mesh_file_name + ".png") 
# plt.show()


#
# plot the mesh nodes boundary labels 
#

fig = plt.figure(2) 
ax = fig.add_subplot (111)
#
# plot the triangles by link the mid-points per elements 
#
plt.triplot (x, y, triangles2, 'ro--', linewidth = 0.2)
#
# plot the triangles by link the vertices points 
#
plt.triplot (x, y, triangles1, 'bo-', linewidth=1)
#
# plot the boundary markers of the nodelist 
#
for i in range(0, x.size):
    ax.annotate (xy_label[i], (x[i],y[i]))




fig.set_size_inches (fig_x_axis_size_inches,  fig_y_axis_size_inches)
plt.title('NodeList Boundary Markers')

fig.savefig(mesh_file_name + "_BoundaryMarker.png") 

plt.show()





