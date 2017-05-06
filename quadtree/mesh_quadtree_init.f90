subroutine mesh_quadtree_init( quadtree, XY )
  use Mesh_QuadTree_H
  implicit none
  type (mesh_quadtree_type) :: quadtree
  real(kind=8) ::XY(2,2)

  quadtree % XY = XY
  !!
  !! the top level is root of the quadtree, 
  !! the level is set as 1 
  !!
  quadtree % level_marker = 1
  nullify(quadtree %level_linker)

return 
end subroutine  


