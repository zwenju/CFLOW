subroutine t3_physical_to_reference_pts(t3, point_num, phy_pts, ref_pts)
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
!!$ --------------------------------------------------------------------------0
!!$ phy_x =  B * ref_x + p1
!!$ --------------------------------------------------------------------------0
!!$ [x]    [x2-x1, x3-x1] [ref_x]     [x1]
!!$ [ ]  = [            ]         +   [  ]
!!$ [y]    [y2-y1, y3-y1] [ref_y]     [y1]
!!$ --------------------------------------------------------------------------0
!!$ --------------------------------------------------------------------------0
!!$ inv(B) *  [ phy_x - p1 ]   =   ref_x
!!$ --------------------------------------------------------------------------0
!!$ [x]    [x2-x1, x3-x1] [ref_x]     [x1]
!!$ [ ]  = [            ]         +   [  ]
!!$ [y]    [y2-y1, y3-y1] [ref_y]     [y1]
!!$
!!$ ******************************************************************************0 
  implicit none
  real (kind=8), intent (in)  :: t3(2, 3) 
  integer (kind=4),intent(in) :: point_num
  real (kind=8), intent (in)  :: phy_pts(2, point_num)
  real (kind=8), intent (out) :: ref_pts(2, point_num)
  real (kind=8) :: B(2,2), INV_B(2,2), det 
  !!
  !! compute B 
  !!
  B(:,1) = t3(:,2)-t3(:,1)
  B(:,2) = t3(:,3)-t3(:,1)
  !!
  !! compute determinant of B 
  !!
  det = B(1,1)*B(2,2) - B(1,2) * B(2,1)
  !!
  !! compute inv (B)
  !!  
  INV_B = reshape((/B(2,2),-B(2,1), &
                   -B(1,2), B(1,1)/),(/2,2/))
  INV_B = INV_B / det
  !!
  !! compute phy_x - p1 
  !!
  ref_pts(1,:) = phy_pts(1,:) - t3(1,1)
  ref_pts(2,:) = phy_pts(2,:) - t3(2,1)
  !!
  !! compute  INV_B * [phy_x -p1]
  !!
  ref_pts = matmul (INV_B, ref_pts)


  return 
end subroutine t3_physical_to_reference_pts
