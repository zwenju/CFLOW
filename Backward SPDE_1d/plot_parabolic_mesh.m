function plot_parabolic_mesh (Mesh, t)

x = Mesh.NodeList;
u = Mesh.u';
exact_u = user_parabolic_exact_solution_1d ( x, t );
figure(1);
hold on 
subplot (1,2,1)
plot (x, u, 'r')
subplot(1,2,2)
plot (x, exact_u, 'b');

legend('FEM', 'TRUE')

end 