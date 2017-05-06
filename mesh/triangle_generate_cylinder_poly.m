function triangulator_generate_cylinder_poly
clear all
close all
clc


X0 = 0.0; Y0 = 0.0;
X1 = 2.2; Y1 = 0.41;

CX0 = 0.2;
CY0 = 0.2;
CR = [0.05];
N = [6];
PointNumOnCircle = N;


cumN = cumsum(N(1:end))+[1,2]

fid = fopen('cylinder.poly', 'w');


    
TotalNumPoints =  4 + sum(PointNumOnCircle) +1;

CountPoints = 0;
fprintf(fid,'%d %d %d %d \n', TotalNumPoints, 2, 0, 1);
CountPoints =  CountPoints + 1; fprintf(fid,'%d %f %f %d\n', CountPoints, X0, Y0, 2);
CountPoints =  CountPoints + 1; fprintf(fid,'%d %f %f %d\n', CountPoints, X1, Y0, 2);
CountPoints =  CountPoints + 1; fprintf(fid,'%d %f %f %d\n', CountPoints, X1, Y1, 2);
CountPoints =  CountPoints + 1; fprintf(fid,'%d %f %f %d\n', CountPoints, X0, Y1, 2);
CountPoints =  CountPoints + 1; fprintf(fid,'%d %f %f %d\n', CountPoints, 2.2, 0.41/2, 3);

AllCircleIndex = [];

for iCircleRing = 1: max(size(N))

thetha = linspace(0, 2*pi, PointNumOnCircle(iCircleRing)+1);


if(iCircleRing==1)
PressureIndex1 = 4 + 1
PressureIndex2 = PressureIndex1 + PointNumOnCircle(iCircleRing) / 2 
end


fprintf(fid,'%s \n', '# Inner Circle');
    
CRadius = CR(iCircleRing);
CircleIndex =[];

if(iCircleRing == 1)
    Marker = 4;
else
    Marker = 0;
end

        for ic = 1:PointNumOnCircle(iCircleRing)

        PX = CX0 + CRadius * cos(thetha(ic));
        PY = CY0 + CRadius * sin(thetha(ic));  
        
        CountPoints =  CountPoints + 1;
        fprintf(fid,'%d %f %f %d \n', CountPoints, PX, PY, Marker);
        CircleIndex = [CircleIndex, CountPoints];
        end

 CircleIndex = [CircleIndex, CircleIndex(1)];
 
 AllCircleIndex = [AllCircleIndex,CircleIndex]; 
end

 %%========================================================================================   
 %% ===========================Output lines ==============================
 fprintf(fid,'%s \n', '# Segments ');
 TotalNumLines = 4 + 1+ sum(PointNumOnCircle);
 
 fprintf(fid,'%d  %d \n',TotalNumLines, 1 );
 
 CountLines = 0;
 CountLines = CountLines + 1; fprintf(fid,'%d %d %d %d \n',1, 1, 2, 2);
 CountLines = CountLines + 1; fprintf(fid,'%d %d %d %d \n',2, 2, 5, 3);
 CountLines = CountLines + 1; fprintf(fid,'%d %d %d %d \n',3, 5, 3, 3);
 CountLines = CountLines + 1; fprintf(fid,'%d %d %d %d \n',4, 3, 4, 2);
 CountLines = CountLines + 1; fprintf(fid,'%d %d %d %d \n',5, 4, 1, 1);
 
 

         
for ic = 1:max(size(AllCircleIndex))-1
   if( prod(cumN-ic))
       if(ic <= cumN(1))
           Marker = 4;
       else
           Marker = 0;
       end
           
    CountLines =  CountLines + 1;
    fprintf(fid,'%d %d %d %d \n', CountLines, AllCircleIndex(ic), AllCircleIndex(ic+1), Marker);
   end
end  
        
 %%========================================================================
 %% ===============================output hole =============================
 fprintf(fid,'%s \n', '# holes ');
 TotalNumHoles = 1;
  
 fprintf(fid,'%d \n', TotalNumHoles);
 CountHoles = 0;
 CountHoles =  CountHoles + 1;
 fprintf(fid,'%d %f %f \n', CountHoles, CX0, CY0);
    
            


 disp('successfully ')
 
end
