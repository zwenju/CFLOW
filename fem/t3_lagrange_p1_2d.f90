subroutine t3_lagrange_p1_2d (point_num, point, value)
!!$ **************************************************************
!!$ First, we have a 1X (3 X point_num) vector 
!!$[\phi_1(x1,y1), \phi_1(x2,y2), \phi_1(x3,y3),..,\phi_1(xn,yn), &
!!$[\phi_2(x1,y1), \phi_2(x2,y2), \phi_2(x3,y3),..,\phi_2(xn,yn), &
!!$[\phi_3(x1,y1), \phi_3(x2,y2), \phi_3(x3,y3),..,\phi_3(xn,yn)]
!!$
!!$ Second, reshape it into a (point_num X 3) matrix, as follows
!!$[\phi_1(x1,y1), \phi_2(x1,y1), \phi_3(x1,y1)]
!!$[\phi_1(x2,y2), \phi_2(x2,y2), \phi_3(x2,y2)]
!!$[\phi_1(x3,y3), \phi_2(x3,y3), \phi_3(x3,y3)]
!!$     ...      ,     ....     ,     .....
!!$[\phi_1(xn,yn), \phi_2(xn,yn), \phi_3(xn,yn)]
!!$
!!$Third, we transpose it into a (3 X point_num) matrix, as follows
!!$[\phi_1(x1,y1), \phi_1(x2,y2),..., \phi_1(xn,yn)]
!!$[\phi_2(x1,y1), \phi_2(x2,y2),..., \phi_2(xn,yn)]
!!$[\phi_3(x1,y1), \phi_3(x2,y2),..., \phi_3(xn,yn)]
!!$Remark, the position of each entities is strictly required as above.  
!!$ the vector of first step is very similiar with the third step 
!!$             (0,1) \phi_3
!!$              |\
!!$              | \
!!$              |  \
!!$  \phi_1 (0,0)|___\(1,0) \phi_2
!!$
!!$The correspondence: 
!!$1. (0,0) ---> \phi_1
!!$2. (1,0) ---> \phi_2
!!$3. (0,1) ---> \phi_3
!!$ **************************************************************
implicit none
integer(kind=4), intent(in) :: point_num
real(kind=8), intent(in)    :: point(2, point_num)
real(kind=8), intent(out)   :: value(3, point_num)
real(kind=8)::x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)

value  = transpose(reshape(         &
                    [1.0d0 - x - y, & 
                                 x, &
                                 y],&
                    [point_num, 3]))
return
end subroutine 






subroutine t3_lagrange_p1_dx_2d (point_num, point, value)
implicit none
integer(kind=4),intent (in) :: point_num
real(kind=8), intent(in)    :: point(2, point_num)
real(kind=8), intent(out)   :: value(3, 2*point_num)
real(kind=8) :: x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)


value  = transpose(reshape( &
                    [ -1.0d0 * x**0.0d0, -1.0d0 * y**0.0d0, & 
                       1.0d0 * x**0.0d0,  0.0d0 * x**0.0d0, &
                       0.0d0 * y**0.0d0,  1.0d0 * y**0.0d0],&
                    [2 * point_num, 3]))
return
end subroutine 





subroutine t3_lagrange_p1_dx2_2d (point_num, point, value)
implicit none
integer(kind=4),intent (in) :: point_num
real(kind=8), intent(in)    :: point(2, point_num)
real(kind=8), intent(out)   :: value(3, 3*point_num)
real(kind=8) :: x(point_num), y(point_num)

x = point(1,:)
y = point(2,:)


value  = transpose(reshape( &
                    [ 0.0d0 * x, 0.0d0 * x,  0.0d0 * x,  & 
                      0.0d0 * x, 0.0d0 * x,  0.0d0 * x,  & 
                      0.0d0 * x, 0.0d0 * x,  0.0d0 * x],  & 
                    [3 * point_num, 3]))
return
end subroutine 



















