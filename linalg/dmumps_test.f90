program  dmumps_test
use dmumps_module 
use Sparse_Matrix_Type_H 
implicit none
type (sparse_matrix_type) :: sparse_matrix 
real (kind=8),allocatable :: RHS(:) 
integer (kind=4) :: I, job_id, IERR 

CALL MPI_INIT(IERR)


IF ( dmumps_par%MYID .eq. 0 ) THEN

    READ(5,*)  sparse_matrix % DimNum
    READ(5,*)  sparse_matrix % NNZ  

    ALLOCATE(  sparse_matrix % IA ( sparse_matrix%NNZ ) )
    ALLOCATE(  sparse_matrix % JA ( sparse_matrix%NNZ ) )
    ALLOCATE(  sparse_matrix % A  ( sparse_matrix%NNZ ) )
    ALLOCATE(  RHS ( sparse_matrix % DimNum  ) )
    
DO I = 1, sparse_matrix % NNZ 
         READ(5,*) sparse_matrix % IA (I), sparse_matrix % JA(I), sparse_matrix% A(I) 
END DO

DO I = 1, sparse_matrix % DimNum 
         READ(5,*)  RHS(I)
END DO

END IF



job_id = 1
call dmumps_init ( sparse_matrix, job_id ) 

job_id = 5
call dmumps_solver (sparse_matrix, RHS, job_id)



WRITE( 6, * ) ' Solution is ',(RHS(I),I=1, dmumps_par%N)






call dmumps_free ()


 CALL MPI_FINALIZE(IERR)
return 

end program 
