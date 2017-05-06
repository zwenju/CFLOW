
subroutine mesh_quadtree_write ( quadtree )
  use Mesh_QuadTree_H
  implicit none
  type (mesh_quadtree_type), target :: quadtree 
  type (mesh_quadtree_type), pointer :: quadtree_ptr, quadtree_root
  integer (kind=4) :: icount 


  icount = 0 
  quadtree_ptr => quadtree  
  do

     if ( associated(quadtree_ptr % child1) ) then 
        icount = icount + 1
        quadtree_ptr => quadtree_ptr % child1 
        quadtree_root => quadtree_ptr  
        write (*,*) " 1 child1 icount = ", icount 

     else if ( .not. associated(quadtree_ptr % child1) ) then 
        exit 

     endif

  enddo

  icount = 0 
  quadtree_ptr  => quadtree_root 
  do   

     if ( associated(quadtree_ptr) ) then 
        icount = icount + 1
        write (*,*) " icount = ", icount 
        write (*,*) "count XY 1 = ", icount, quadtree_ptr % XY 

        quadtree_ptr => quadtree_ptr % level_linker

        write (*,*) "associated quadtree_ptr ", associated(quadtree_ptr)
     else  

        write (*,*) " loop end "

        exit 

     endif

  enddo







  return 
end subroutine mesh_quadtree_write

