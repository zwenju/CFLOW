Module Mesh_QuadTree_H 
!!
!!INTEGER (KIND=1)  (8 bits) Signed integer value from --128 to 127 (--2**7 to 2**7--1). 
!!


  type mesh_quadtree_type  
     !!
     !! (x1,y2)----------------(x2,y2)
     !! |     3     |     4       |
     !! | child3 | child4   |
     !! -------------------------- 
     !! |     1     |     2       |
     !! | child1 | child2   |
     !! (x1,y1)----------------(x2,y1)
     !!
     !!
     !! XY = [x1, x2]
     !!      [y1, y2]     
     !!
     !!
     real(kind=8) :: XY(2,2)
     integer (kind=4) :: SubElementNum
     real(kind=8), allocatable :: SubElementList(:)

     !!
     !! ---------------------------
     !! |     3     |     4       |
     !! | child3 | child4   |
     !! -------------------------- 
     !! |     1     |     2       |
     !! | child1 | child2   |
     !! ---------------------------
     !!
     type (mesh_quadtree_type), pointer :: child1 => null()
     type (mesh_quadtree_type), pointer :: child2 => null()
     type (mesh_quadtree_type), pointer :: child3 => null()
     type (mesh_quadtree_type), pointer :: child4 => null()

     type (mesh_quadtree_type),pointer :: level_linker => null() 
     integer (kind=1) :: level_marker = int(0, kind=1)





  end type  mesh_quadtree_type


  type (mesh_quadtree_type), pointer :: mesh_quadtree_root 






end module Mesh_QuadTree_H







































