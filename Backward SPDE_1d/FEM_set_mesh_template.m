function [Mesh] = FEM_set_mesh_template

Mesh.DimNum = 0;

Mesh.NodeNum = 0;
Mesh.ElementNum = 0;

Mesh.NodeList = 0;
Mesh.ElementList = 0;

Mesh.u = 0;

Mesh.SU = 0;

%% 
% SpMat_I : row index;
% SpMat_J : col index;
% SpMat_V : entities 

Mesh.SpMat_I = 0;
Mesh.SpMat_J = 0;
Mesh.SpMat_V = 0;

end 
