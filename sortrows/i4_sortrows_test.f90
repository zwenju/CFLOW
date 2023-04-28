program i4_sortrows_test
implicit none
integer(kind=4),allocatable :: A (:, :), At(:,:), AA(:,:)
integer(kind=4) :: nmemb, nsize, unique_num

nmemb = 6 * 3 
nsize = 7

allocate(A(nsize, nmemb), AA(nsize, nmemb),  At(nmemb, nsize))

A =          ( reshape([  95,    45,    92,    41,    13,     1,    84,   & 
                          95,     7,    73,    89,    20,    74,    52,   & 
                          95,     7,    73,     5,    19,    44,    20,   &
                          95,     7,    40,    35,    60,    93,    67,   &
                          76,    61,    93,    81,    27,    46,    83,   &
                          76,    79,    91,     0,    19,    41,     1,  &
                          95,    45,    92,    41,    13,     1,    84,   & 
                          95,     7,    73,    89,    20,    74,    52,   & 
                          95,     7,    73,     5,    19,    44,    20,   &
                          95,     7,    40,    35,    60,    93,    67,   &
                          76,    61,    93,    81,    27,    46,    83,   &
                          76,    79,    91,     0,    19,    41,     1,   &
                          95,    45,    92,    41,    13,     1,    84,   & 
                          95,     7,    73,    89,    20,    74,    52,   & 
                          95,     7,    73,     5,    19,    44,    20,   &
                          95,     7,    40,    35,    60,    93,    67,   &
                          76,    61,    93,    81,    27,    46,    83,   &
                          76,    79,    91,     0,    19,    41,     1], [7, 6*3 ] ))

AA = A 
At = transpose (A)

call i4_write_matrix (At, nmemb, nsize,  " reverse sort A")

write(*,*) "============sort========================================"
A = AA
call i4_sortrows(A, nmemb, nsize)

A = AA 
call i4_unique_sortrows (A, nmemb, nsize, unique_num)

write(*,*) "unique_num = ", unique_num 


write(*,*) "==================sort reverse ======================"
A = AA 
call i4_sortrows_reverse(A, nmemb, nsize)

A = AA 
call i4_unique_sortrows_reverse(A, nmemb, nsize, unique_num)
write(*,*) "unique_num = ", unique_num 




end program 





subroutine i4_write_matrix (A, m, n, name)
implicit none
integer (kind=4) :: m, n
integer (kind=4) :: A(m,n)
character (len=*) :: name
integer (kind=4) :: i 

write(*,*) 

do i = 1, m

write(*,*) A(i, :)

enddo 


end subroutine 
