function system_matrix = set_system_matrix_bdary_condition (Mesh, system_matrix)
global a b 



%% set boundary condition 
system_matrix(1,:) = 0;
system_matrix(1,1) = 1;

system_matrix(Mesh.NodeNum,:) = 0;
system_matrix(Mesh.NodeNum,Mesh.NodeNum) = 1;

system_rhs(1) = user_elliptic_dirichlet_bdry_condition_1d ( Mesh.NodeList(:,1) );

system_matrix(Mesh.NodeNum,:) = 0;
system_matrix(Mesh.NodeNum,Mesh.NodeNum) = 1;
system_rhs(Mesh.NodeNum) = user_elliptic_dirichlet_bdry_condition_1d ( Mesh.NodeList(:,end) );



end 