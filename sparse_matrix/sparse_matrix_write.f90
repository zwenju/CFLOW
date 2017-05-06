subroutine sparse_matrix_write ( sparse_matrix )
  use Sparse_Matrix_Type_H
  implicit none
  type (sparse_matrix_type),intent(in) :: sparse_matrix
  integer (kind=4) :: I 


  if ( associated (sparse_matrix % csr_row_ptr) ) then 

     !!
     !! write csr 
     !!
     write (*,*) "the matrix is in csr format ", "DimNum = ", sparse_matrix%DimNum, "NNZ = ", sparse_matrix%NNZ
     do I = 1,  sparse_matrix % NNZ
        
        if (I <= sparse_matrix%DimNum + 1) then 
        write (*,*) I, sparse_matrix%A(I), sparse_matrix%IA(I), sparse_matrix%JA(I), sparse_matrix%csr_row_ptr(I)
        else
        write (*,*) I, sparse_matrix%A(I), sparse_matrix%IA(I), sparse_matrix%JA(I)
        endif 
    
     enddo

  else if ( associated (sparse_matrix % csc_col_ptr) ) then 
     !!
     !! write csc 
     !!
     write (*,*) "the matrix is in csc format ", "DimNum = ", sparse_matrix%DimNum, "NNZ = ", sparse_matrix%NNZ
     do I = 1,  sparse_matrix % NNZ
  
        if (I <= sparse_matrix%DimNum + 1) then 
        write (*,*) I, sparse_matrix%A(I), sparse_matrix%IA(I), sparse_matrix%JA(I), sparse_matrix%csc_col_ptr(I)
        else
        write (*,*) I, sparse_matrix%A(I), sparse_matrix%IA(I), sparse_matrix%JA(I)
        endif 


     enddo


  else 
     !!
     !! write coo 
     !!
     write (*,*) "the matrix is in coo format ", "DimNum = ", sparse_matrix%DimNum, "NNZ = ", sparse_matrix%NNZ
     do I = 1,  sparse_matrix % NNZ
        write (*,*) I, sparse_matrix%A(I), sparse_matrix%IA(I), sparse_matrix%JA(I)
     enddo


  endif


  return 
end subroutine sparse_matrix_write
