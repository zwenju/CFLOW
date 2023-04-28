subroutine apply_boundary_condition(Mesh, system_matrix, system_rhs )
use Mesh_Type_H
use Sparse_Matrix_Type_H 
implicit none
type (mesh_type) :: Mesh 
type (sparse_matrix_type) :: system_matrix 
real (kind=8) :: system_rhs (system_matrix % DimNum )
integer (kind=4) :: n6(6)
real (kind=8) :: loc_rhs 
integer (kind=4) :: s1, s2, sidx, iNode, iNodeMarker 


do iNode = 1, Mesh%NodeNum 

iNodeMarker = Mesh % NodeBdryList (iNode)
if ( iNodeMarker /= 0 ) then 


     s1 = system_matrix % csr_row_ptr ( iNode ) 
     s2 = system_matrix % csr_row_ptr ( iNode + 1 ) - 1

     system_matrix % A (s1:s2) = 0.0d0 
    
    call csr_submatrix_location_idx( system_matrix, iNode, 1, iNode, 1, sidx )
    
     system_matrix % A ( sidx ) =  1


    

    call user_exact_solution ( 1,  Mesh % NodeList(1:2, iNode), loc_rhs  ) 
    system_rhs (iNode) = loc_rhs 


endif 

enddo 

return

end subroutine 
