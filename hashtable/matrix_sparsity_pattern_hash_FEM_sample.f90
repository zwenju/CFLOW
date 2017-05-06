subroutine matrix_sparsity_pattern_hash_FEM_sample (Mesh,  sparse_matrix)
use Mesh_Type_H
use SparseMatrix_Type_H
implicit none
integer (kind=4) :: iElement 


  call matrix_hash_init () 

  element_loop : do iElement= 1, Mesh%ElementNum 

     n6 = Mesh%ElementList(:, iElement)
     call Solver%getLoc2GlobalIndex(Mesh%NodeNum,n6, idx)

     do irow = 1, LocBasisNum 
     do jcol = 1, LocBasisNum 

     call matrix_hash_insert ( sparse_matrix%DimNum,  idx(irow), idx(jcol) )

     enddo
     enddo 

  enddo element_loop
  
  !
  ! Part II, set the diaginal part for the sparse matrix to be definitive
  !
  do iDiagonal = 1, sparse_matrix%DimNum
     call matrix_hash_insert ( sparse_matrix%DimNum,  idx(irow), idx(jcol) )
  enddo


  call matrix_hash_size ( non_zero_num )

  sparse_matrix%NNZ =  non_zero_num;
  sparse_matrix%DimNum  = Mesh%DimNum; 



  allocate(sparse_matrix%A ( sparse_matrix%NNZ) )
  allocate(sparse_matrix%IA( sparse_matrix%NNZ) )
  allocate(sparse_matrix%JA( sparse_matrix%NNZ) )

  sparse_matrix%A  = 0.0d0 

  call matrix_hash_to_coo(sparse_matrix%DimNum, sparse_matrix%IA, sparse_matrix%JA)
  
  call matrix_hash_free()



  call coo_to_csr_row_ptr ( sparse_matrix )  

return 
end subroutine  


