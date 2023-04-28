subroutine set_quadrature_fespace ( ) 
use GLOBAL_INFO_H 

implicit none
integer (kind=4) :: dunavant_quad_rule, dunavant_order_num 



dunavant_quad_rule = 4 
call dunavant_rule_to_order_num ( dunavant_quad_rule, dunavant_order_num )

quadrature % quad_num_2d = dunavant_order_num 
allocate ( quadrature % ref_quad_points_2d  ( 2, quadrature % quad_num_2d ) )
allocate ( quadrature % ref_quad_weights_2d (    quadrature % quad_num_2d ) )

allocate ( quadrature % phy_quad_points_2d  ( 2, quadrature % quad_num_2d ) )
allocate ( quadrature % phy_quad_weights_2d (    quadrature % quad_num_2d ) )

call  dunavant_rule ( dunavant_quad_rule, dunavant_order_num, quadrature%ref_quad_points_2d, quadrature % ref_quad_weights_2d )


!!
!! subroutine t3_lagrange_p2_2d (points, points_num, value) 
!!
fespace % loc_basis_num_2d = 6 

allocate ( fespace % ref_basis_2d     ( fespace%loc_basis_num_2d,    quadrature% quad_num_2d) )
allocate ( fespace % ref_basis_dx_2d  ( fespace%loc_basis_num_2d,  2*quadrature% quad_num_2d) )

allocate ( fespace % phy_basis_2d     ( fespace%loc_basis_num_2d,    quadrature% quad_num_2d) )
allocate ( fespace % phy_basis_dx_2d  ( fespace%loc_basis_num_2d,  2*quadrature% quad_num_2d) )

call t3_lagrange_p2_2d      ( quadrature%quad_num_2d, quadrature%ref_quad_points_2d,  fespace%ref_basis_2d    ) 
call t3_lagrange_p2_dx_2d   ( quadrature%quad_num_2d, quadrature%ref_quad_points_2d,  fespace%ref_basis_dx_2d ) 


return
end subroutine 
