function plot_solution
close all
data = load ('solution.txt');


x = data(:,1);
y = data(:,2);

u = data(:,3);

dy =0.01;
dx = dy;
[xq,yq] = meshgrid( min(x) : dx: max(x), min(y) : dx: max(y));



uq = griddata(x, y, u, xq, yq);


pcolor(xq, yq, uq);
shading interp

filename = strcat( 'noise_4_', int2str(i)  );
print( filename, '-dpng')












end