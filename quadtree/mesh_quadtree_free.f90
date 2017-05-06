subroutine mesh_quadtree_free( quadtree )
!!$ *****************************************************************
!!$ Here for simplity we set the quadtree_head (20), under the assumption that 
!!$ the max level is not excess 20  
!!$ it is reasonable for that 4**20 = 1099511627776, this memory is too large 
!!$ algorithm
!!$ loop all the child1= > child1=> into and store them into quadtree(20)
!!$ accord the max level index 
!!$ delete the memory from the deep level to top level 
!!$ when delete each level, we need to check the level_marker if level_marker is
!!$ equal to the delete level_index delete it, otherwise, we do not delete it 
!!$ *************************************************************************
 use Mesh_QuadTree_H
 
  implicit none
  type (mesh_quadtree_type),target :: quadtree
  type (mesh_quadtree_type), pointer :: ptr_parent, ptr_child1, ptr_child2
  type (mesh_quadtree_type),target :: quadtree_head(20)  
  integer (kind=4) :: iLevel, quadtree_max_level, icount 


  ptr_parent => quadtree

  iLevel = 1 
  quadtree_head (1) = quadtree 
  ptr_child1 => quadtree%child1  
  do while ( associated(ptr_child1) )
  iLevel = iLevel + 1
  quadtree_head (iLevel) =  ptr_child1
  ptr_child1 => ptr_child1 % child1  
  enddo

  quadtree_max_level  = iLevel 
  
  do iLevel = quadtree_max_level, 1, -1 
  !!
  !! open the file to be written 
  !!
  ptr_child1 => quadtree_head (iLevel)
  icount = 0 
  do  while ( associated( ptr_child1 ) ) 
        
        if ( ptr_child1%level_marker == iLevel ) then  
        icount = icount + 1
        call mesh_quadtree_delete ( ptr_child1 )
        endif         


        ptr_child2 => ptr_child1 % level_linker
        ptr_child1 => ptr_child2 
  enddo
  write (*,*) "At Level = ", iLevel, " Deleted Number = ", icount 

  enddo

return 
end subroutine  





subroutine mesh_quadtree_delete (  quadtree  )
  use Mesh_QuadTree_H
  implicit none
  type (mesh_quadtree_type) :: quadtree


  if (associated( quadtree%child1) )  allocate ( quadtree % child1 )
  if (associated( quadtree%child2) )  allocate ( quadtree % child2 )
  if (associated( quadtree%child3) )  allocate ( quadtree % child3 )
  if (associated( quadtree%child4) )  allocate ( quadtree % child4 )
  return
end subroutine  
