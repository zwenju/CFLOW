function [L2, H1] =  FEM_calculate_parabolic_L2_H1_with_bspde (Mesh, t, T_END, iMidPts)
global k_fespace

%% create sparse matrix 
L2 = 0;
H1 = 0;
%% 
FESPACE = k_fespace;
for iElement = 1 : Mesh.ElementNum
    
    n2 = Mesh.ElementList(1:2, iElement);
    t2 = Mesh.NodeList(n2);
    
    idx = FEM_loc_to_global_idx (Mesh, n2);
    
    fespace = par_fespace_reference_2_physical_transform_1d(t2, FESPACE);
    
    phy_basis_dx = fespace.phy_basis_dx;
    phy_basis    = fespace.phy_basis;
    
    wts = fespace.phy_quad_wts;
    
    %% exact solution 
    exact_value    = user_parabolic_exact_solution_1d    (fespace.phy_quad_pts, t, T_END, 0);
    exact_value_dx = user_parabolic_exact_solution_dx_1d (fespace.phy_quad_pts, t, T_END, 0);
    
    %% numerical solution 
    %%Mesh.SU(:, iMidPts )
    
    loc_coef_u  =  Mesh.SU(idx(1:2), iMidPts )';
    loc_coef_v  =  Mesh.SU(idx(3:4), iMidPts )';
    
    loc_u    = loc_coef_u * phy_basis;
    loc_u_dx = loc_coef_u * phy_basis_dx;
    
    loc_v    = loc_coef_v * phy_basis;
    loc_v_dx = loc_coef_v * phy_basis_dx;
        
    loc_L2_u = sum ((loc_u - exact_value(1,:)).^2 .* wts );
    loc_H1_u = sum((loc_u_dx - exact_value_dx(1,:)).^2 .* wts);
    

    loc_L2_v = sum ((loc_v   - exact_value(2,:)).^2 .* wts );
    loc_H1_v = sum((loc_v_dx - exact_value_dx(2,:)).^2 .* wts);
    

    L2 = L2 + [loc_L2_u, loc_L2_v];
    H1 = H1 + [loc_H1_u, loc_H1_v];
end

L2 = sqrt (L2);
H1 = sqrt (H1);



end