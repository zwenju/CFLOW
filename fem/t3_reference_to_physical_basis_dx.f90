subroutine t3_reference_to_physical_basis_dx(t3, basis_num, point_num, ref_basis_dx, phy_basis_dx)
!!$ *****************************************************************************************************0
!!$  ref_basis_dx =
!!$  [dx_ref_basis_1 (x1, y1), dx_ref_basis_1(x2,y2),  dy_ref_basis_1(x1,y1), dy_ref_basis_1(x2,y2)]
!!$  [dx_ref_basis_2 (x1, y1), dx_ref_basis_2(x2,y2),  dy_ref_basis_2(x1,y1), dy_ref_basis_2(x2,y2)]
!!$  [dx_ref_basis_3 (x1, y1), dx_ref_basis_3(x2,y2),  dy_ref_basis_3(x1,y1), dy_ref_basis_3(x2,y2)]
!!$ ------------------------------------------------------------------------------
!!$  this routine is true for the affine transformation 
!!$  phy_basis ( B * ref_x + p1 ) = ref_basis (ref_x)
!!$ --------------------------------------------------------------------
!!$  key relationship 
!!$  B = [t3(1:2, 2) - t3(1:2, 1), t3(1:2, 3) - t3(1:2, 1)]
!!$ ----------------------------------------------------------------------------- 0
!!$ [ dx_ref_basis(x,y), dy_ref_basis(x,y)] = [dx_basis(x,y), dy_basis(x,y)] * B 
!!$ ----------------------------------------------------------------------------- 0 
!!$the gradient of different basis function on the same point -------------------------------------------0
!!$ [dx_ref_basis_1(x1,y1), dy_ref_basis_1(x1,y1)]   [dxbasis_1(x1,y1), dybasis_1(x1,y1)]
!!$ [dx_ref_basis_2(x1,y1), dy_ref_basis_2(x1,y1)]   [dxbasis_2(x1,y1), dybasis_2(x1,y1)]  [x2-x1,x3-x1]
!!$ [dx_ref_basis_3(x1,y1), dy_ref_basis_3(x1,y1)] = [dxbasis_3(x1,y1), dybasis_3(x1,y1)]* [y2-y1,y3-y1]
!!$ [dx_ref_basis_1(x2,y2), dy_ref_basis_1(x2,y2)]   [dxbasis_1(x1,y1), dybasis_1(x1,y1)]
!!$ [dx_ref_basis_2(x2,y2), dy_ref_basis_2(x2,y2)]   [dxbasis_2(x1,y1), dybasis_2(x1,y1)]  
!!$ [dx_ref_basis_3(x2,y2), dy_ref_basis_3(x2,y2)]   [dxbasis_3(x1,y1), dybasis_3(x1,y1)] 
!!$ *****************************************************************************************************0 
  implicit none
  real(kind=8),intent(in)   :: t3(2, 3)
  integer(kind=4),intent(in):: basis_num, point_num  
  real(kind=8),intent(in)   :: ref_basis_dx (basis_num * point_num, 2)
  real(kind=8),intent(out)  :: phy_basis_dx (basis_num * point_num, 2)
  real(kind=8) :: B(2,2), INV_B(2,2), det
  !!
  !! compute B  
  !!
  B(:,1) = t3(:,2) - t3(:,1)
  B(:,2) = t3(:,3) - t3(:,1)
  !!
  !! compute  det (B)
  !!
  det = B(1,1)*B(2,2) - B(1,2) * B(2,1)
  !!
  !! compute the inv(B)
  !! 
  INV_B = reshape((/B(2,2),-B(2,1), &
                   -B(1,2), B(1,1)/),(/2,2/))
  INV_B = INV_B / det
  !!
  !! [ dx_ref_basis(x,y), dy_ref_basis(x,y)] * inv (B) = [dx_basis(x,y),dy_basis(x,y)]
  !!
  phy_basis_dx = matmul(ref_basis_dx, INV_B)

  return 
end subroutine t3_reference_to_physical_basis_dx
