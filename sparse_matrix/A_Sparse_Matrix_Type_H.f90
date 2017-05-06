module Sparse_Matrix_Type_H 
  implicit none 

  type ::  sparse_matrix_type

     !!
     !! The maximum size of nonzero entities to be allocated 
     !!
     integer(kind=4):: MAX_NNZ  

     !!
     !! The current nonzeros entities allocated 
     !!

     integer(kind=4)::NNZ
     integer(kind=4)::DimNum


     real(kind=8), dimension(:), pointer :: A => null()  

     integer(kind=4), dimension(:), pointer :: IA => null()
     integer(kind=4), dimension(:), pointer :: JA => null()

     integer(kind=4), dimension(:), pointer :: csr_row_ptr => null()
     integer(kind=4), dimension(:), pointer :: csc_col_ptr => null()

 
  end type sparse_matrix_type


end module Sparse_Matrix_Type_H 

