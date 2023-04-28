program test
  implicit none
  integer(kind=4) ::   i,j,n 
  integer(kind=4) :: non_zero_num 
  integer(kind=4),allocatable :: ia(:), ja(:)


  call matrix_hash_init()



  do i = 1, 10
     do j = 2, 5
        n = 5 
        call matrix_hash_insert (n, i, j)
     enddo
  enddo


  do i = 1, 10
     do j = 2, 5
        n = 5 
        call matrix_hash_insert (n, i, j)
     enddo
  enddo

  call matrix_hash_size ( non_zero_num );

  write(*,*) "the nonzero number = ", non_zero_num 

  allocate(ia(non_zero_num), ja(non_zero_num))
  ia = 0; ja = 0
  call matrix_hash_to_coo (n, ia, ja);

  write(*, *) " ia, ja nonzero_num = ", non_zero_num  
  do i = 1, non_zero_num 
     write(*,* ) ia(i), ja(i)

  enddo




end program test
