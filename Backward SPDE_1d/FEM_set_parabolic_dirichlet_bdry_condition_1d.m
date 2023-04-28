function [system_matrix, system_rhs] = FEM_set_parabolic_dirichlet_bdry_condition_1d ( Mesh, t, T_END, system_matrix, system_rhs, u, wx )

%% set boundary condition 
%% for u 

v1 = 1;
v2 = Mesh.NodeNum+1;

system_matrix(v1,:) = 0;
system_matrix(v1,v1) = 1;

system_matrix(v2,:) = 0;
system_matrix(v2,v2) = 1;

value = user_parabolic_dirichlet_bdry_condition_1d ( Mesh.NodeList(1), t,T_END, wx );
system_rhs(v1) = u(v1) - value(1);
system_rhs(v2) = u(v2) - value(2);


%% q 



v1 = Mesh.NodeNum;
v2 = Mesh.NodeNum*2;

system_matrix(v1,:) = 0;
system_matrix(v1,v1) = 1;

system_matrix(v2,:) = 0;
system_matrix(v2,v2) = 1;

value = user_parabolic_dirichlet_bdry_condition_1d ( Mesh.NodeList(end), t, T_END, wx );
system_rhs(v1) = u(v1) - value(1);
system_rhs(v2) = u(v2) - value(2);


%% q 





end

