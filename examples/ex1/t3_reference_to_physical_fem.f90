subroutine t3_reference_to_physical_fem ( fespace, quadrature, t3 )
!!$ ******************************************************************************0
!!$ the reference triangle             arbitrary triangle 
!!$         (3)                                (3)  
!!$          |\                               /  \
!!$          | \                             /    \
!!$          |  \                           /      \
!!$      (1) |___\(2)                   (1)/________\(2)
!!$
!!$ vertices: [ 0 1 0 ]                   [x1, x2, x3]  
!!$           [ 0 0 1 ]                   [y1, y2, y3] 
!!$ ******************************************************************************0 
  use FEM_SPACE_TYPE_H 
  use Quadrature_Rule_Type_H 
  implicit none
  type (fem_space_type), intent (inout) :: fespace 
  type ( quadrature_rule_type), intent (inout) :: quadrature 
  real (kind=8), intent (in) :: t3(2,3)

  real(kind=8) :: B(2,2), INV_B(2,2)
  real(kind=8) :: area 

   
  call t3_triangle_area (t3, area)
  call t3_reference_to_physical_pts (t3, quadrature%quad_num_2d, quadrature%ref_quad_points_2d, quadrature%phy_quad_points_2d)
  quadrature % phy_quad_weights_2d = area * quadrature % ref_quad_weights_2d 


  fespace % phy_basis_2d = fespace % ref_basis_2d
  call t3_reference_to_physical_basis_dx(t3, fespace%loc_basis_num_2d, quadrature%quad_num_2d, &
                                             fespace%ref_basis_dx_2d,  fespace%phy_basis_dx_2d)


  return 
end subroutine 




