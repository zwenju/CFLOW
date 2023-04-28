subroutine mesh_quadtree_write_py ( quadtree, file_name )
  use Mesh_QuadTree_H
  implicit none
  type (mesh_quadtree_type), intent(in), target :: quadtree 
  character (len=100),intent(in) :: file_name
  character (len=100) file_quadtree 
  character (len=10) :: I_String
  integer(kind=4), parameter :: out_unit =  10000



  type (mesh_quadtree_type), pointer :: ptr_parent, ptr_child
  integer (kind=4) :: iLevel, icount 


  ptr_parent => quadtree

  
  !!
  !! The first loop is for the child 1 => child 1 => child 1 ...
  !!
 iLevel = 0 
  do while ( associated(ptr_parent) )
 
  !!
  !! open the file to be written 
  !!
  iLevel = iLevel + 1 
  write (I_String, '(I10)')  iLevel
  file_quadtree = trim(file_name)//"_"//  trim ( ADJUSTL( I_String) ) //".txt"
  open ( unit = out_unit, file=file_quadtree )
   
  icount = 0
  ptr_child => ptr_parent 
  do  while ( associated( ptr_child ) ) 

        icount = icount + 1     
        write ( out_unit, * ) icount, ptr_child % XY , ptr_child % level_marker 
        ptr_child => ptr_child % level_linker

  enddo

  close (out_unit)
  
  !!
  !! loop to next generation 
  !!  
  ptr_parent => ptr_parent % child1

  enddo


end subroutine  

