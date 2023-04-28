function fespace_reference_2_physical_transform_1d(t2)
global fespace

len = t2(2) - t2(1);
fespace.phy_basis = fespace.ref_basis;
fespace.phy_basis_dx = fespace.ref_basis_dx / len;

fespace.phy_quad_pts = t2(1) + fespace.ref_quad_pts * len;
fespace.phy_quad_wts = fespace.ref_quad_wts * len;

end 