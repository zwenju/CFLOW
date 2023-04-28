function [Mesh] = FEM_create_mesh_1d( a, b, N )
%%
%% Parameter : [a, b is the region interval.
% N is the number of partition of [a, b]
if (b < a) 
    disp('Error in create_mesh_1D, b should be greater than a.');
end

NodeList = linspace (a,b,N+1);
NodeNum  = N+1;
ElementList = zeros(2, N);
ElementNum = N;

ElementList(1,1:N) = 1:N;
ElementList(2,1:N) = 2:N+1;

Mesh = FEM_set_mesh_template;


Mesh.DimNum =  2 * NodeNum;
Mesh.NodeNum     = NodeNum;
Mesh.ElementNum  = ElementNum;
Mesh.NodeList    = NodeList;
Mesh.ElementList = ElementList;

%% the first and the last nodes are the boundary nodes,
% here, we have not defined the NodeMarkerList 


end 