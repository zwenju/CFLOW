function edges=fedge(verts,faces,tets)
%
nt=length(tets);
ix=zeros(6*nt,1);
iy=zeros(6*nt,1);
iz=ones(6*nt,1);
for it=1:nt
    localv=[faces(1,tets(1,it)),faces(2,tets(1,it)),faces(3,tets(1,it)),...
      faces(3,tets(2,it))];

    ix((6*(it-1)+1):(6*it))=[localv(1),localv(1),localv(1),...
      localv(2),localv(2),localv(3)];
    iy((6*(it-1)+1):(6*it))=[localv(2),localv(3),localv(4),...
      localv(3),localv(4),localv(4)];
end
edges=sparse(ix,iy,iz,length(verts),length(verts));

[ix,iy]=find(edges);
iz=1:length(ix);
clear edges
edges=sparse(ix,iy,iz,length(verts),length(verts));