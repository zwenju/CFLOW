program main 
use Mesh_QuadTree_H 
implicit none

type (mesh_quadtree_type) :: quadtree 
character (len=100) :: file_name 

integer (kind=4), pointer  :: p => null()
integer (kind=4) :: i, Level 
real (kind=8) :: XY(2,2)

real(kind=8),pointer :: PP(:)

write (*,*) "size of PP(:)", sizeof (PP), STORAGE_SIZE(PP)
write (*,*) "assicoate p",  associated (p)



XY (1:2,1) = [0.0d0, 0.0d0]
XY (1:2,2) = [1.0d0, 1.0d0]



write (*,*) "integer ", STORAGE_SIZE (i)
write (*,*)  "storage size =",  STORAGE_SIZE(quadtree)
write (*,*)  "size of size =",  sizeof(quadtree)


Level = 11

call mesh_quadtree_init ( quadtree, XY )
call mesh_quadtree_level_refine ( quadtree, Level )



!!call mesh_quadtree_write (quadtree)

file_name = "output/mesh_quadtree"
call mesh_quadtree_write_py (quadtree, file_name)



call mesh_quadtree_free( quadtree )






return 
end  
