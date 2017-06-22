function [verts, faces, tets] = meshProc(mesh)

% [dum,nE]=size(mesh.e); % which is not necessary
[dum,nt]=size(mesh.t);
[dum,nv]=size(mesh.p);
NGtets = mesh.t;
NGverts = mesh.p;
for it = 1:nt
    NGtets(1:4, it) = sort(NGtets(1:4,it));
end

tets1=[NGtets(1:4,:);(1:nt)];
ftemp=[tets1([1,2,3,5],:),tets1([1,2,4,5],:),tets1([1,3,4,5],:),tets1([2,3,4,5],:);...
        ones(1,nt),2*ones(1,nt),3*ones(1,nt),4*ones(1,nt)];
ftemp=ftemp';
ftemp=sortrows(ftemp,[1,2,3]);
clear tets1

[dum,leNG] = size(NGtets);
tets=zeros(9,leNG);
tets(9,:)=NGtets(5,:);
nf=0;
nfl=length(ftemp);
prev=[0,0,0];
faces=zeros(3,nfl);
ifaces = zeros(1,nfl);
joint=zeros(4,nfl);
for iff=1:nfl
    if norm(prev-ftemp(iff,1:3))~=0
       nf=nf+1;
       prev=ftemp(iff,1:3);
       faces(:,nf)=prev';
       joint(1,nf)=ftemp(iff,4);
       joint(2,nf)=ftemp(iff,5);
    else
       joint(3,nf)=ftemp(iff,4);
       joint(4,nf)=ftemp(iff,5);
    end
    tets(ftemp(iff,5),ftemp(iff,4))=nf;
    ifaces(nf)=ifaces(nf)+1;
end
faces=[faces(:,1:nf);zeros(1,nf)];
ifaces = ifaces(1:nf);
clear ftemp 

for iff=1:nf
   if joint(4,iff)~=0
      tets(4+joint(2,iff),joint(1,iff))=joint(3,iff);
      tets(4+joint(4,iff),joint(3,iff))=joint(1,iff);
   end
end
clear joint

verts=NGverts(1:3,:);

clear NGtets 
clear NGverts


tetsn=reorder(tets);
[dum, ltetsn] = size(tetsn);
tets=zeros(5,ltetsn);
tets(1:4,:)=tetsn(1:4,:);
tets(5,:)=tetsn(9,:);
clear tetsn
