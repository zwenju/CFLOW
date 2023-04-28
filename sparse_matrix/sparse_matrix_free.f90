  subroutine sparse_matrix_free (sparse_matrix)
  use Sparse_Matrix_Type_H 
  implicit none 
  type (sparse_matrix_type) :: sparse_matrix  

  if ( associated(sparse_matrix%A)  )         deallocate (sparse_matrix%A)
  if ( associated(sparse_matrix%IA) )         deallocate (sparse_matrix%IA)
  if ( associated(sparse_matrix%JA) )         deallocate (sparse_matrix%JA)
  if ( associated(sparse_matrix%csc_col_ptr)) deallocate (sparse_matrix%csc_col_ptr)
  if ( associated(sparse_matrix%csr_row_ptr)) deallocate (sparse_matrix%csr_row_ptr)

  return 
  end subroutine 
 

