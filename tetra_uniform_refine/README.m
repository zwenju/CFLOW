The program uniformly refine a tetrahedra mesh

Usage: 
[rmesh, mapping] = TetraURefine(mesh)
% uniform refinement of a tetrhedra mesh
% Input - mesh: a tetrahedra mesh. 
%           mesh.p coordinates of the nodes
%           mesh.t four nodes of a tetrahedron
% Output - rmesh: the uniform refined mesh
%          mapping: relation between the original and the refined meshes
% Author: Jiguang Sun, 06/25/2013, jiguangs@mtu.edu
% Please report bugs to jiguangs@mtu.edu
% Copyright (c) 2011, Jiguang Sun, rights reserved. 
% THIS SOFTWARE IS PROVIDED "AS IS".
% Redistribution and use in source and binary forms, with or without 
% modification, are permitted.

Example: Refine a tetrahedra mesh for a unit ball
Copy all the files into a folder

load ballC
[rmesh, mapping] = TetraURefine(mesh)