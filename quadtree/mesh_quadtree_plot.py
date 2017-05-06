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
quadtree_max_level = str(sys.argv[2])
print (acommand_line_args) 
print ("QuadTree Max Level = ", quadtree_max_level) 

mesh_file_name = acommand_line_args 

for iLevel in range (2, int(quadtree_max_level)) : 
	#
	# concatenate the node and element files with suffix 
	#
	mesh_quadtree_file = mesh_file_name + str(iLevel) + ".txt"
	#
	# using numpy to load the nodelist and element list 
	#
	mesh_quadtree  = np.loadtxt( mesh_quadtree_file )
	#
	# set x,y points for the matplotlib.triplot
	#
	quadtree = mesh_quadtree [:, 1:5]

	max_x =  np.amax( quadtree[:, [0,2]] , axis=0) 
	min_x =  np.amin( quadtree[:, [0,2]] , axis=0) 

	max_y =  np.amax( quadtree[:, [1,3]] , axis=0) 
	min_y =  np.amin( quadtree[:, [1,3]] , axis=0) 
	scale = 8
	fig_x_axis_size_inches = scale * ( max_x - min_x ) 
	fig_y_axis_size_inches = scale * ( max_y - min_y )


	fig = plt.figure(1) 
	ax = fig.add_subplot (111)


	for i in range(0, quadtree[:,0].size):
	    x1 = quadtree[i,0]
	    y1 = quadtree[i,1]
	    x2 = quadtree[i,2]
	    y2 = quadtree[i,3]
	    xc = (x1 + x2) / 2.0
	    yc = (y1 + y2) / 2.0
	    plt.plot( [x1, x2, x2, x1, x1], [y1, y1, y2, y2, y1], '-' )
	    ax.annotate (i+1, (xc, yc))



	#fig.set_size_inches (fig_x_axis_size_inches,  fig_y_axis_size_inches)
	#plt.title('Quad Tree')

	fig.savefig(mesh_file_name + str(iLevel) + "_quadtree.eps", format='eps', dpi=1000) 

	plt.show()
	plt.close("all")





