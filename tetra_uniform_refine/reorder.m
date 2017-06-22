function tetsn=reorder(tets)
[dum, nt]=size(tets);
ie=0;
ix=zeros(5*nt,1);
iy=ix;
for it=1:nt
    ie=ie+1;
    ix(ie)=it;
    iy(ie)=it;
    j=find(tets(5:8,it)~=0);
    nj=length(j);
    ix(ie+(1:nj))=it;
    iy(ie+(1:nj))=tets(j+4,it);
    ie=ie+nj;
end
j=find(ix~=0);
ixa=ix(j);
iya=iy(j);
ix=ixa;
iy=iya;

z=ones(size(ix));
M=sparse(ix,iy,z);

p=symrcm(M);

tetsn=zeros(9,nt);
invp(p)=1:length(p);

for it=1:nt
    j=find(tets(5:8,it)~=0);
    pp=zeros(4,1);
    pp(j)=invp(tets(j+4,it));
    tetsn(:,invp(it))=[tets(1:4,it);pp;tets(9,it)];
end

