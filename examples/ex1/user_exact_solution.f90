subroutine user_exact_solution (point_num, point, value)
implicit none
integer (kind=4) :: point_num
real (kind=8) :: point (2, point_num)
real (kind=8) :: value (point_num)


real (kind=8) :: x (point_num)
real (kind=8) :: y (point_num)


x = point(1,:)
y = point(2,:)

value = sin (x * y)



return
end subroutine 
