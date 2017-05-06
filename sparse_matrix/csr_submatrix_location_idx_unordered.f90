subroutine csr_submatrix_location_idx_unordered( sparse_matrix, sub_rows_idx, sub_rows_n, sub_cols_idx, sub_cols_n, sidx )
  use Sparse_Matrix_Type_H 
  implicit none

  type (sparse_matrix_type) :: sparse_matrix  
  integer (kind=4),intent (in) :: sub_rows_n, sub_cols_n
  integer (kind=4),intent (in) :: sub_rows_idx(sub_rows_n), sub_cols_idx (sub_cols_n)
  integer (kind=4),intent (out):: sidx (sub_rows_n, sub_cols_n)
  integer (kind=4) :: idx_ordered (sub_rows_n)
  integer (kind=4) :: icol, irow, i_col_idx, s1, s2, k 
  !!
  !! set index_ordered as an ordered sequence, e.g., [1,2,3,4, ....]
  !! 
  sidx = 0
  !!
  !! first do the loop for the columns 
  !!
  loop_rows : do irow = 1, sub_rows_n 

     !!
     !! get the sparse matrix's  icol-th entities's locations  
     !!
     s1 = sparse_matrix % csr_row_ptr ( sub_rows_idx(irow) ) 
     s2 = sparse_matrix % csr_row_ptr ( sub_rows_idx(irow)+1 ) - 1
     !!
     !! loop each columns, the complexity is O(n)
     !! 
     loop_cols :  do icol = 1, sub_cols_n 

        !!
        !!  k , s1, s2 are the address of the array in the memroy 
        !!
        i_col_idx = sub_cols_idx ( icol ) 
        loop_inner_col :  do k = s1, s2 

           !!
           !! to check the rows idx 
           !!

           if  ( i_col_idx ==  sparse_matrix%JA(k) ) then 

              sidx ( irow, icol ) = k

              exit 

           endif

        enddo loop_inner_col

     enddo loop_cols

  enddo loop_rows


  return 
end subroutine csr_submatrix_location_idx_unordered 


