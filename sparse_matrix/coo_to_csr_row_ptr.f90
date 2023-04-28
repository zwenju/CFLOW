subroutine coo_to_csr_row_ptr (sparse_matrix)
!!$
!!$ Coordinate Storage (COO) : Compressed Sparse Column (CSC) 
!!$ 
!!$ CSR is benefit when the algorithms heavily on being able to traverse rows of the matrix 
!!$ CSC format is better for computing the multiplication of mat-vec on the parallel machines.
!!$
  use Sparse_Matrix_Type_H 
  implicit none 
  type (sparse_matrix_type), intent(inout) :: sparse_matrix 
  integer (kind=4) :: icount, n 

  !!
  !! check whether coo is pre-allocated or not 
  !!
  if (sparse_matrix%DimNum == 0) then
     write (*, *) "Error in sparse_matrix_coo_to_csc : "
     write (*, *) "The sparse matrix coo storage may be not allocated or the DimNum is not assigned"
  endif


  allocate( sparse_matrix%csr_row_ptr (sparse_matrix%DimNum+1) )

  !! 
  !! The following procedure already assumed that coo is ordered in the row-oriented
  !! The qsort complex is O(nnz) log(nnz). 
  !! If the coo is not ordered, the qsort can be called first
  !! The complexity will be O(nnz) or O(nnz) + O(nnz) log(nnz).
  !!
  icount = 1
  sparse_matrix%csr_row_ptr(1) = 1

  do n = 2, sparse_matrix%NNZ 
     if ( sparse_matrix%IA(n) /= sparse_matrix%IA(n-1) ) then 

        icount = 1 + icount 
        sparse_matrix%csr_row_ptr (icount) = n

     endif
  enddo

  if (icount+1 /= sparse_matrix%DimNum+1) then
     write (*, *) "Error in sparse_matrix_coo_to_csc : "
     write (*, *) "icount+1  should equal to sparse_matrix%DimNum+1"
  endif

  sparse_matrix%csr_row_ptr (icount+1) = sparse_matrix%NNZ + 1



  return
end subroutine coo_to_csr_row_ptr
