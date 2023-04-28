function [L2, H1] =  FEM_calculate_L2_H1_with_exact_sol (Mesh)
global fespace

%% create sparse matrix 
L2 = 0;
H1 = 0;
%% 
for iElement = 1 : Mesh.ElementNum
    
    n2 = Mesh.ElementList(1:2, iElement);
    t2 = Mesh.NodeList(n2);
    
    fespace_reference_2_physical_transform(t2)
    
    phy_basis_dx = fespace.phy_basis_dx;
    phy_basis    = fespace.phy_basis;
    
    w = fespace.phy_quad_wts;
    
    %% exact solution 
    exact_value    = user_elliptic_exact_solution_1d    (fespace.phy_quad_pts);
    exact_value_dx = user_elliptic_exact_solution_dx_1d (fespace.phy_quad_pts);
    
    %% numerical solution 
    loc_coef_u  = Mesh.u(n2)';
    
    loc_u    = loc_coef_u * phy_basis;
    loc_u_dx = loc_coef_u * phy_basis_dx;
    
    loc_L2 = sum ((loc_u - exact_value).^2 .* w );
    loc_H1 = sum((loc_u_dx - exact_value_dx).^2 .* w);
    
    L2 = L2 + loc_L2;
    H1 = H1 + loc_H1;
end

L2 = sqrt (L2);
H1 = sqrt (H1);



end