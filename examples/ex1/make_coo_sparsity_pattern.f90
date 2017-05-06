subroutine make_coo_sparsity_pattern (Mesh, sparse_matrix)
  use Mesh_Type_H
  use Sparse_Matrix_Type_H
  implicit none
  type (mesh_type) :: Mesh
  type (sparse_matrix_type) :: sparse_matrix  
  integer (kind=4) :: iElement, NNZ
  integer (kind=4) :: irow, jcol, idx(6), n6(6)
  integer (kind=4) :: LocBasisNum 


 LocBasisNum = 6 

  call matrix_hash_init () 
  sparse_matrix%DimNum  = Mesh%NodeNum 

  element_loop : do iElement= 1, Mesh%ElementNum 

     n6 = Mesh%ElementList(:, iElement)
     call getLoc2GlobalIndex(Mesh%NodeNum, n6, idx)

     do irow = 1, LocBasisNum 
        do jcol = 1, LocBasisNum 

           call matrix_hash_insert ( sparse_matrix%DimNum,  idx(irow), idx(jcol) )

        enddo
     enddo

  enddo element_loop

  !
  ! Part II, set the diaginal part for the sparse matrix to be definitive
  !
  do iElement = 1, sparse_matrix%DimNum
     call matrix_hash_insert ( sparse_matrix%DimNum,  iElement, iElement )
  enddo


  call matrix_hash_size ( NNZ )

  sparse_matrix%NNZ =  NNZ;



  allocate(sparse_matrix%A ( sparse_matrix%NNZ) )
  allocate(sparse_matrix%IA( sparse_matrix%NNZ) )
  allocate(sparse_matrix%JA( sparse_matrix%NNZ) )

  sparse_matrix%A   = 0.0d0 
  sparse_matrix%IA  = 0
  sparse_matrix%JA  = 0 

  call matrix_hash_to_coo(sparse_matrix%DimNum, sparse_matrix%IA, sparse_matrix%JA)

  call matrix_hash_free()



  call coo_to_csr_row_ptr ( sparse_matrix )  

  return 
end subroutine make_coo_sparsity_pattern


