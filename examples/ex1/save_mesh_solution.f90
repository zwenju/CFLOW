subroutine save_mesh_solution ( Mesh, Solution )
use Mesh_Type_H
use Sparse_Matrix_Type_H
implicit none
type ( mesh_type ) :: Mesh 
real(kind=8) :: Solution(Mesh%NodeNum)
integer (kind=4) :: iNode 


open (unit=1000, file="solution.txt")

do iNode = 1, Mesh%NodeNum
write (1000,*)  Mesh%NodeList(1:2, iNode), Solution(iNode)
enddo 

close(1000)

return
end subroutine 
