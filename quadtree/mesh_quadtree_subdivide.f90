subroutine mesh_quadtree_subdivide (  quadtree  )
  use Mesh_QuadTree_H
  implicit none
  type (mesh_quadtree_type) :: quadtree
  real(kind=8) :: x1, y1, x2, y2, xc, yc 
  integer (kind=1) :: level_marker 


  allocate ( quadtree % child1 )
  allocate ( quadtree % child2 )
  allocate ( quadtree % child3 )
  allocate ( quadtree % child4 )

  !!
  !! (x1,y2)-----(x12,y22)-------(x2,y2)
  !! |     3       |      4        |
  !! | child3   | child4     |
  !! (x11,y12)---(xc,yc)--------(x22,y12)
  !! |     1       |     2         |
  !! | child1   | child2     |
  !! (x1,y1)-----(x12, y11)------(x2,y1)
  !!


  !!
  !! the XY is stored for left bottom to right top 
  !!--------------
  !! nw ------- n  -------- ns 
  !! |          |           |
  !! |child3 |child4  |
  !! w ---------c --------- e 
  !! |          |           |
  !! |child1 | child2 |   
  !! sw --------s --------- se 
  !!

  x1 = quadtree % XY(1,1)
  y1 = quadtree % XY(2,1)
  x2 = quadtree % XY(1,2)
  y2 = quadtree % XY(2,2) 

  xc = (x1 + x2) / 2.0d0 
  yc = (y1 + y2) / 2.0d0 
  
  level_marker = quadtree % level_marker + int(1, kind=1)
  
  !! child 1 
  quadtree % child1 % XY(:,1) = [x1, y1]
  quadtree % child1 % XY(:,2) = [xc, yc] 
  quadtree % child1 % level_marker = level_marker 
  quadtree % child1 % level_linker =>  quadtree % child2 


  !! child 2 
  quadtree % child2 % XY(:,1) = [xc, y1]
  quadtree % child2 % XY(:,2) = [x2, yc]
  quadtree % child2 % level_marker = level_marker 
  quadtree % child2 % level_linker =>  quadtree % child3 


  !! child 3 
  quadtree % child3 % XY(:,1) = [x1, yc]
  quadtree % child3 % XY(:,2) = [xc, y2]
  quadtree % child3 % level_marker = level_marker 
  quadtree % child3 % level_linker =>  quadtree % child4  


  !! child 4 
  quadtree % child4 % XY(:,1) = [xc, yc]
  quadtree % child4 % XY(:,2) = [x2, y2]
  quadtree % child4 % level_marker = level_marker 
  nullify(quadtree % child4 % level_linker)


  return 
end subroutine mesh_quadtree_subdivide 




