function edgelab=labeledge(verts,edges,faces,tets)

ne=max(max(edges));
edgelab=zeros(ne,1);
locfaces=faces;

locfaces(4,:)=2;
 
for it=1:length(tets)
    locfaces(4,tets(1:4,it))=locfaces(4,tets(1:4,it))-1;
end

locfaces(4,:)=-locfaces(4,:);
bf=find(locfaces(4,:)==-1);
nbf=length(bf);
nsurf=0;

wfaces=locfaces(1:3,:);

while nbf>0
   nsurf=nsurf+1;
   is(1)=bf(1);
   bf(1)=0;
   nis=1;
   vf=wfaces(:,is(1));
   nvf=3;
   change=1;
   while change>0
      change=0;
      iff=find(bf>0);
      bf=bf(iff);
      nbf=length(bf);
      for j=1:nbf
            t1=find(vf(1:nvf)==wfaces(1,bf(j)));
            t2=find(vf(1:nvf)==wfaces(2,bf(j)));
            t3=find(vf(1:nvf)==wfaces(3,bf(j)));
            if isempty([t1;t2;t3])~=1
               change=1;
               nis=nis+1;
               is(nis)=bf(j);
               bf(j)=0;
               if isempty(t1)==1
                  nvf=nvf+1;
                  vf(nvf)=wfaces(1,is(nis));
               end
               if isempty(t2)==1
                  nvf=nvf+1;
                  vf(nvf)=wfaces(2,is(nis));
               end
               if isempty(t3)==1
                  nvf=nvf+1;
                  vf(nvf)=wfaces(3,is(nis));
               end
            end
      end
   end
   locfaces(4,is(1:nis))=nsurf; 
end


for j=1:nsurf
  lnew(j)=j;
end

for j=1:length(faces)
 if locfaces(4,j)>0
    locfaces(4,j)=lnew(locfaces(4,j));
    edgelab(edges(locfaces(1,j),locfaces(2,j)))=lnew(locfaces(4,j));
    edgelab(edges(locfaces(1,j),locfaces(3,j)))=lnew(locfaces(4,j));
    edgelab(edges(locfaces(2,j),locfaces(3,j)))=lnew(locfaces(4,j));
 end
end

