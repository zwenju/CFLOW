subroutine t3_lagrange_p2_2d (point_num, point, value) 
!!$ ***************************************************0
!!$
!!$               (0,1) basis_3
!!$                  |\
!!$                  | \
!!$                  |  \
!!$   basis_5 (0,1/2)|   \(1/2,1/2) basis_4
!!$                  |    \
!!$                  |     \
!!$     basis_1 (0,0)|______\(1,0) basis_2
!!$                   (1/2,0)basis_6
!!$The correspondence: 
!!$1. (0,0)     ---> basis_1
!!$2. (1,0)     ---> basis_2
!!$3. (0,1)     ---> basis_3
!!$4. (1/2,1/2) ---> basis_4
!!$5. (0,1/2)   ---> basis_5
!!$6. (1/2,0)   ---> basis_6
!!$the storage scheme are same with the above P1, matrix
!! ****************************************************0
implicit none 
integer(kind=4),intent(in) :: point_num
real(kind=8),intent(in)    :: point(2, point_num)
real(kind=8),intent(out)   :: value(6, point_num)
real(kind=8)::x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)
value  = transpose(reshape(                          &
[(1.0d0 - x - y) * (1.0d0 - 2.0d0*x - 2.0d0 * y),    &
                         x * (2.0d0 * x - 1.0d0),    &
                         y * (2.0d0 * y - 1.0d0),    &
                                   4.0d0 * x * y,    &
                      4.0d0 * y *(1.0d0 - x - y),    &
                      4.0d0 * x *(1.0d0 - x - y)],   &
                    [point_num, 6])) 
return
end subroutine 

subroutine t3_lagrange_p2_dx_2d (point_num, point, value) 
implicit none 
integer(kind=4), intent(in) :: point_num
real(kind=8), intent(in)    :: point(2,point_num)
real(kind=8), intent(out)   :: value(6, 2*point_num)
real(kind=8) :: x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)
!!
!! [dx, dy]
!!
value    =     transpose(reshape(                                         &
        [4.0d0*x + 4.0d0*y - 3.0d0,     4.0d0*x + 4.0d0*y - 3.0d0,        &
         4.0d0*x - 1.0d0,               0.0d0*x**0.0d0,                   &
         0.0d0*x**0.0d0 ,               4.0d0*y - 1.0d0,                  &
         4.0d0*y,                       4.0d0*x,                          &
        -4.0d0*y,                       4.0d0 - 8.0d0*y - 4.0d0*x,        &
         4.0d0 - 4.0d0*y - 8.0d0*x,    -4.0d0*x],                         &
        [2*point_num, 6])) 
return 
end subroutine 







subroutine t3_lagrange_p2_dx2_2d (point_num, point, value) 
implicit none 
integer(kind=4), intent(in) :: point_num
real(kind=8), intent(in)    :: point(2,point_num)
real(kind=8), intent(out)   :: value(6, 3*point_num)
real(kind=8) :: x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)
!!
!! [dxx, dxy, yy]
!!
value    =     transpose(reshape(                                  &
        [4.0d0*x**0.0d0,   4.0d0*x**0.0d0,   4.0d0*y**0.0d0,       &
         4.0d0*x**0.0d0,   0.0d0*x**0.0d0,   0.0d0*x**0.0d0,       &
         0.0d0*x**0.0d0,   0.0d0*x**0.0d0,   4.0d0*y**0.0d0,       &
         0.0d0*x**0.0d0,   4.0d0*y**0.0d0,   0.0d0*x**0.0d0,       &
         0.0d0*x**0.0d0,  -4.0d0*y**0.0d0,  -8.0d0*y**0.0d0,       &
        -8.0d0*x**0.0d0,  -4.0d0*y**0.0d0,   0.0d0*x**0.0d0],      &
        [3*point_num, 6])) 

return 
end subroutine 





















