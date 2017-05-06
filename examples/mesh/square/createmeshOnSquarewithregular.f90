program main
implicit none
!
!  Example:
!
!    Input:
!
!      NX = 4, NY = 3
!
!    Output:
!
!      ELEMENT_NODE =
!         1,  3, 15,  2,  9,  8;
!        17, 15,  3, 16,  9, 10;
!         3,  5, 17,  4, 11, 10;
!        19, 17,  5, 18, 11, 12;
!         5,  7, 19,  6, 13, 12;
!        21, 19,  7, 20, 13, 14;
!        15, 17, 29, 16, 23, 22;
!        31, 29, 17, 30, 23, 24;
!        17, 19, 31, 18, 25, 24;
!        33, 31, 19, 32, 25, 26;
!        19, 21, 33, 20, 27, 26;
!        35, 33, 21, 34, 27, 28.
!
!  Diagram:
!
!   29-30-31-32-33-34-35
!    |\ 8  |\10  |\12  |
!    | \   | \   | \   |
!   22 23 24 25 26 27 28
!    |   \ |   \ |   \ |
!    |  7 \|  9 \| 11 \|
!   15-16-17-18-19-20-21
!    |\ 2  |\ 4  |\ 6  |
!    | \   | \   | \   |
!    8  9 10 11 12 13 14
!    |   \ |   \ |   \ |
!    |  1 \|  3 \|  5 \|
!    1--2--3--4--5--6--7
!======================================================
integer(kind=4) :: nx, ny
integer(kind=4) :: element_num, node_num 
integer(kind=4),allocatable :: elementlist(:,:), boundary_mark(:)
real(kind=8),allocatable :: nodelist(:,:)

integer(kind=4) :: node_file_unit, element_file_unit
integer(kind=4) :: imesh , mesh_num
character(len=20)::nodefile, elementfile, istr, meshpath

nx = 1
ny = 1

meshpath = "box."
mesh_num = 7
do imesh = 1, mesh_num




nx = 2 * nx  
ny = 2 * ny

element_num = nx * ny * 2
node_num = ( nx + nx + 1) * (ny + ny + 1)

allocate(nodelist(2,node_num))
allocate(elementlist(6,element_num))
allocate(boundary_mark(node_num)) 


call   xy_set_t6(nx,ny, node_num, nodelist, boundary_mark)
call   element_set_t6( nx, ny , element_num, elementlist)







node_file_unit = 1
element_file_unit = 2



write(istr,"(I10)")  imesh  
nodefile = trim(meshpath)//trim(adjustl(istr))//".node"
elementfile = trim(meshpath)//trim(adjustl(istr))//".ele"


open(unit=node_file_unit, file = nodefile)
open(unit=element_file_unit, file = elementfile)

call writemeshtofile( node_file_unit, element_file_unit, nodelist, elementlist, boundary_mark, element_num, node_num)

close(node_file_unit)
close(element_file_unit)
deallocate(nodelist, elementlist, boundary_mark) 


enddo 







end program 



subroutine writemeshtofile( node_file_unit, element_file_unit, nodelist, elementlist, boundary_mark, element_num, node_num)
implicit none
integer(kind=4) ::  node_file_unit, element_file_unit
integer(kind=4) ::  element_num, node_num 
integer(kind=4) ::  elementlist(6, element_num)
real(kind=8)    :: nodelist(2, node_num)
integer(kind=4) :: boundary_mark(node_num)
integer(kind=4) :: inode, ielement

write(*,*) node_num, 2 , 0, 1
write(node_file_unit,*) node_num, 2 , 0, 1
do inode  = 1, node_num 
write(node_file_unit, *) inode, nodelist(:, inode), boundary_mark(inode) 
!write(*, *) inode, nodelist(:, inode), boundary_mark(inode) 
enddo 


write(element_file_unit, *) element_num, 6, 0  
do ielement = 1, element_num 
write(element_file_unit,*) ielement, elementlist(:, ielement)
enddo 


return 
end subroutine  




subroutine   xy_set_t6(nx,ny, node_num, nodelist, boundary_mark)
  implicit none
  integer(kind=4) :: nx,ny,node_num
  real(kind=8) ::  dx , dy , ty 
  real(kind=8):: nodelist(2, node_num)
  integer(kind=4) :: boundary_mark(node_num)
  integer(kind=4) :: i, j
  integer(kind=4)::tick 


  !> the region is [0,1] x [0,1]
  !> nx is the number of the triangle edge on the x-axis
  !> ny is the number of the triangle edge on the y-axis
  !> node_num = ( nx + nx + 1 ) x (ny + ny + 1)



  dx =  1.0d0 / nx 
  dy =  1.0d0 / ny

!! the vertices points  
tick = 0
  do  j = 1,  ny + 1
     ty = real(j-1,8) * dy 

     do  i = 1,  nx + 1
        tick = tick + 1
        nodelist(1, tick ) = real(i-1,8) * dx
        nodelist(2, tick ) = ty 

     enddo
  enddo


 do j = 1, 2*ny + 1
  ty =  0.5 * real(j-1) * dx  
   if (mod(j,2) /= 0) then 
    
     do i = 1, nx 
        tick = tick + 1
        nodelist(1, tick ) = real(i,8) * dx - 0.5d0 * dx 
        nodelist(2, tick ) = ty 
     enddo
   else
     do i = 1, 2 * nx + 1 
        tick = tick + 1
        nodelist(1, tick ) = 0.5d0 * real(i-1,8) * dx
        nodelist(2, tick ) = ty 
     enddo
   endif

  enddo 


!!!! set boundary conditions 
tick = 0
  do  j = 1,  ny + 1
     ty = real(j-1,8) * dy 

     do  i = 1,  nx + 1
        tick = tick + 1

        if(j == 1 .or. j == ny+1) then 
           boundary_mark( tick ) = 2
        
        elseif( i == 1 .and. j/=1.and. j /= ny + 1) then
           boundary_mark( tick ) = 1
        
        elseif( i == nx+1 .and. j/=1 .and. j/= ny + 1) then
           boundary_mark( tick ) = 3
        
        else
           boundary_mark( tick ) = 0
        endif
     enddo
  enddo



!!! set  middle points ======
 do j = 1, 2*ny + 1
   
  if (mod(j,2) /= 0) then 
    
     do i = 1, nx 
        tick = tick + 1
        if(j == 1 .or. j == 2* ny+1) then 
           boundary_mark( tick ) = 2
        else
           boundary_mark( tick) = 0
        endif         
     enddo
   
  else
  
   do i = 1, 2*nx + 1
   tick = tick + 1
     
   if(i == 1 ) then 

           boundary_mark( tick ) = 1
   elseif(i==2*nx + 1) then
           boundary_mark( tick ) = 3
   else 
           boundary_mark( tick ) = 0
   endif

   enddo  
   endif 

  enddo 



  return
end subroutine xy_set_t6



 

subroutine  element_set_t6( nx, ny , element_num, elementlist)
implicit none
integer(kind=4) :: nx, ny, element_num
integer(kind=4) :: i, j, tick, vertex_num 
integer(kind=4) :: sw, s, se, w, c, e, nw, n, ne  
integer(kind=4) :: elementlist(6, element_num)

!  Example:
!
!    Input:
!
!      NX = 4, NY = 3
!
!    Output:
!
!      ELEMENT_NODE =
!         1,  3, 15,  2,  9,  8;
!        17, 15,  3, 16,  9, 10;
!         3,  5, 17,  4, 11, 10;
!        19, 17,  5, 18, 11, 12;
!         5,  7, 19,  6, 13, 12;
!        21, 19,  7, 20, 13, 14;
!        15, 17, 29, 16, 23, 22;
!        31, 29, 17, 30, 23, 24;
!        17, 19, 31, 18, 25, 24;
!        33, 31, 19, 32, 25, 26;
!        19, 21, 33, 20, 27, 26;
!        35, 33, 21, 34, 27, 28.
!
!  Diagram:
!
!   29-30-31-32-33-34-35
!    |\ 8  |\10  |\12  |
!    | \   | \   | \   |
!   22 23 24 25 26 27 28
!    |   \ |   \ |   \ |
!    |  7 \|  9 \| 11 \|
!   15-16-17-18-19-20-21
!    |\ 2  |\ 4  |\ 6  |
!    | \   | \   | \   |
!    8  9 10 11 12 13 14
!    |   \ |   \ |   \ |
!    |  1 \|  3 \|  5 \|
!    1--2--3--4--5--6--7
!=============================================================

tick = 0


vertex_num = (nx + 1) * ( ny + 1) 
do j = 1, ny
do i = 1, nx


      sw =  (nx + 1) * real(j-1) + i 
      s  =  vertex_num + (nx + nx + nx + 1) * real(j-1) + i
      se = sw + 1

      w  =  vertex_num + (nx + nx + nx + 1) * real(j-1) + nx  + 2*i-1 
      c  = w  + 1
      e  = w  + 2

      nw = sw  + nx + 1
      n  = vertex_num + (nx + nx + nx +1) * real(j-1) + 3*nx + 1  + i 
      ne = nw + 1

tick = tick + 1

elementlist(1,tick) = sw 
elementlist(2,tick) = ne 
elementlist(3,tick) = nw 

elementlist(4,tick) = n 
elementlist(5,tick) = w 
elementlist(6,tick) = c 



tick = tick + 1

elementlist(1,tick) = sw 
elementlist(2,tick) = se 
elementlist(3,tick) = ne 

elementlist(4,tick) = e 
elementlist(5,tick) = c 
elementlist(6,tick) = s 


enddo 
enddo 



end subroutine 
























