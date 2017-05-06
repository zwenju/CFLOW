#!/usr/bin/python
import sys
import os 
import numpy as np
from   matplotlib.mlab import griddata
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
# ex: ./plot_solution_py.py   solution.txt 
# 
acommand_line_args = str(sys.argv[1])
print (acommand_line_args) 

data_file_name = acommand_line_args 
#
#
# using numpy to load the nodelist and element list 
#
data = np.loadtxt( data_file_name )
#
# set x,y points for the matplotlib.triplot
#
x = data [:, 0] 
y = data [:, 1]  
u = data [:, 2] 

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

nx = 100
ny = nx 
xq,yq = np.meshgrid(np.linspace(min_x, max_x, nx), np.linspace(min_y, max_y, ny)) 

zq = griddata ( x, y, u, xq, yq, interp='linear' )


fig = plt.figure(1) 
ax = fig.add_subplot (111)






plt.pcolor(xq, yq, zq)







fig.set_size_inches (fig_x_axis_size_inches,  fig_y_axis_size_inches)
#fig.savefig(mesh_file_name + ".png") 
plt.show()






