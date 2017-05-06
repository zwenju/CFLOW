subroutine t3_reference_to_physical_pts(t3, point_num, ref_pts, phy_pts)
!!$ **************************************************************0
!!$ the reference triangle             arbitrary triangle 
!!$         (3)                                (3)  
!!$          |\                               /  \
!!$          | \                             /    \
!!$          |  \                           /      \
!!$      (1) |___\(2)                   (1)/________\(2)
!!$
!!$ vertices: [ 0 1 0 ]                   [x1, x2, x3]  
!!$           [ 0 0 1 ]                   [y1, y2, y3] 
!!$ --------------------------------------------------------------0
!!$ phy_x =  B * ref_x + p1
!!$ --------------------------------------------------------------0
!!$ [x]    [x2-x1, x3-x1] [ref_x]     [x1]
!!$ [ ]  = [            ]         +   [  ]
!!$ [y]    [y2-y1, y3-y1] [ref_y]     [y1]
!!$ **************************************************************0 
implicit none
real (kind=8), intent (in)  :: t3 (2, 3)
integer (kind=4),intent(in) :: point_num 
real (kind=8), intent (in)  :: ref_pts(2, point_num)
real (kind=8), intent (out) :: phy_pts(2, point_num)
real (kind=8) :: B(2,2)
!!
!! compute B 
!!
B(1:2, 1) = t3(1:2, 2) - t3(1:2, 1)
B(1:2, 2) = t3(1:2, 3) - t3(1:2, 1)
!!
!! compoute B * ref_x 
!!
phy_pts = matmul (B, ref_pts) 
!!
!! compute B * ref_x + p1
!!
phy_pts (1, 1:point_num) = phy_pts (1, 1:point_num) + t3(1,1)
phy_pts (2, 1:point_num) = phy_pts (2, 1:point_num) + t3(2,1)


return 
end subroutine 
