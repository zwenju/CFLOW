function [rmesh, mapping] = TetraURefine(mesh)
% uniform refinement of a tetrhedra mesh -- Jiguang Sun, 06/25/2013
% Input - mesh: a tetrahedra mesh. 
%           mesh.p coordinates of the nodes
%           mesh.t four nodes of a tetrahedron
% Output - rmesh: the uniform refined mesh
%          mapping: relation between the original and the refined meshes
[dum,nt]=size(mesh.t);
[dum,nv]=size(mesh.p);
for it = 1:nt
    mesh.t(1:4, it) = sort(mesh.t(1:4,it));
end
% process the original mesh
[verts, faces, tets] = meshProc(mesh);
% set up the edge matrix
edges=fedge(verts,faces,tets);
% label the edge
edglab=labeledge(verts,edges,faces,tets);
edgnum = length(edglab);

p = zeros(3, edgnum+nv); 
p(:,1:nv)=mesh.p;
t = ones(5, nt*8);

mappingP = zeros(2, edgnum+nv);
mappingT = zeros(1, nt*8);
% refinement and mapping
for it = 1:nt
    localv = mesh.t(1:4, it); 
    edgeN1 = nv+edges(localv(1), localv(2)); 
    mappingP(1,edgeN1) = localv(1); mappingP(2,edgeN1) = localv(2);
    x=(mesh.p(1:3,localv(1))+mesh.p(1:3,localv(2)))/2;p(1:3,edgeN1)=x;
    edgeN2 = nv+edges(localv(1), localv(3));
    mappingP(1,edgeN2) = localv(1); mappingP(2,edgeN2) = localv(3);
    x=(mesh.p(1:3,localv(1))+mesh.p(1:3,localv(3)))/2;p(1:3,edgeN2)=x;
    edgeN3 = nv+edges(localv(1), localv(4));
    mappingP(1,edgeN3) = localv(1); mappingP(2,edgeN3) = localv(4);
    x=(mesh.p(1:3,localv(1))+mesh.p(1:3,localv(4)))/2;p(1:3,edgeN3)=x;
    edgeN4 = nv+edges(localv(2), localv(3));
    mappingP(1,edgeN4) = localv(2); mappingP(2,edgeN4) = localv(3);
    x=(mesh.p(1:3,localv(2))+mesh.p(1:3,localv(3)))/2;p(1:3,edgeN4)=x;
    edgeN5 = nv+edges(localv(2), localv(4));
    mappingP(1,edgeN5) = localv(2); mappingP(2,edgeN5) = localv(4);
    x=(mesh.p(1:3,localv(2))+mesh.p(1:3,localv(4)))/2;p(1:3,edgeN5)=x;
    edgeN6 = nv+edges(localv(3), localv(4));
    mappingP(1,edgeN6) = localv(3); mappingP(2,edgeN6) = localv(4);
    x=(mesh.p(1:3,localv(3))+mesh.p(1:3,localv(4)))/2;p(1:3,edgeN6)=x;
    
    v=[localv(1) localv(2) localv(3) localv(4) edgeN1 edgeN2 edgeN3 edgeN4 edgeN5 edgeN6];
    t(1:4,1+(it-1)*8)=sort([v(1);v(5);v(6);v(7)]); 
    t(1:4,2+(it-1)*8)=sort([v(2);v(5);v(8);v(9)]);
    t(1:4,3+(it-1)*8)=sort([v(3);v(6);v(8);v(10)]);
    t(1:4,4+(it-1)*8)=sort([v(4);v(7);v(9);v(10)]);
    t(1:4,5+(it-1)*8)=sort([v(5);v(6);v(7);v(9)]);
    t(1:4,6+(it-1)*8)=sort([v(6);v(7);v(9);v(10)]);
    t(1:4,7+(it-1)*8)=sort([v(5);v(6);v(8);v(9)]);
    t(1:4,8+(it-1)*8)=sort([v(6);v(8);v(9);v(10)]);
    mappingT(1+(it-1)*8:8+(it-1)*8) = it;
end
mapping.t = mappingT; mapping.p=mappingP;
rmesh.p =p; rmesh.t =t;
