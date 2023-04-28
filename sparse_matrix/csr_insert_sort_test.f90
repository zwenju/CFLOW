program csr_insert_sort_test
implicit none

integer (kind=4) :: idx_ordered(6), icol 
integer (kind=4) :: sub_cols_idx (6)



 idx_ordered = [ ( icol, icol = 1, 6 ) ]

 sub_cols_idx = [  5,  2, 7,  14,  21,   11]
 sub_cols_idx = [  3,  2, 7,  14,  21,   11]

write (*,*) "1, idx_ordered = ", idx_ordered 
 call csr_insert_sort( 6, sub_cols_idx, idx_ordered)

write (*,*) "sub_cols_idx = ", sub_cols_idx 
write (*,*) "2, idx_ordered = ", idx_ordered 


return
end program 
