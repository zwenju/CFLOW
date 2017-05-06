subroutine mesh_quadtree_level_refine ( quadtree, Level )
  use Mesh_QuadTree_H 
  implicit none
  integer (kind=4) :: Level 
  type (mesh_quadtree_type),target :: quadtree 
  type (mesh_quadtree_type), pointer  ::  ptr_parent
  type (mesh_quadtree_type), pointer  ::  ptr_child1  
  type (mesh_quadtree_type), pointer  ::  ptr_child2 
  integer (kind=4) :: iLevel, icount 

  ptr_parent => quadtree 

 !!
 !! set the second level of quadtree 
 !!
  call mesh_quadtree_subdivide ( ptr_parent )

  do iLevel = 3, Level 

     ptr_parent    => ptr_parent % child1 
     ptr_child1 => ptr_parent
     ptr_child2 => ptr_child1 % level_linker 
    
     !!
     !! we first subdivide the first child 
     !!
     call mesh_quadtree_subdivide ( ptr_child1 )
     do while (  associated ( ptr_child2 ) ) 

        call mesh_quadtree_subdivide ( ptr_child2 )
       
        ptr_child1%child4%level_linker =>  ptr_child2%child1 
        ptr_child1 => ptr_child2 

        ptr_child2 => ptr_child2%level_linker 

     enddo


  enddo


  return 
end subroutine mesh_quadtree_level_refine

