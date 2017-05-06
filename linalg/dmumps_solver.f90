!!$ ***********************************************
!!$ Usage : 
!!$ include 'mpif.h'
!!$ include 'dmumps_struc.h'
!!$ TYPE (DMUMPS_STRUC) mumps_par
!! ***********************************************
subroutine dmumps_init (sparse_matrix, JOB_ID)
!!$ *********************************************
!!$ job = 1 perform the analysis
!!$ job = 2 perform the factorization
!!$ job = 3 compute the solution
!!$ job = 4 combine the actions of job=1 and job=2
!!$ job = 5 combine the actions of job=2 and job=3
!!$ job = 6 combine the actions of job=1,2,3
!!$ ********************************************
  use Sparse_Matrix_Type_H 
  use dmumps_module 
  implicit none
  type (sparse_matrix_type) :: sparse_matrix 
  integer(kind=4) :: IERR
  integer(kind=4) :: JOB_ID 

  dmumps_par%COMM = MPI_COMM_SELF

  dmumps_par%JOB = -1
  dmumps_par%SYM =  0
  dmumps_par%PAR =  1

  CALL DMUMPS(dmumps_par)

  if ( dmumps_par%MYID == 0 ) then
     dmumps_par%N   =  sparse_matrix % DimNum 
     dmumps_par%NZ  =  sparse_matrix % NNZ  
     dmumps_par%IRN => sparse_matrix % IA 
     dmumps_par%JCN => sparse_matrix % JA 
     dmumps_par%A   => sparse_matrix % A 
  end if

  dmumps_par%ICNTL(1) = -1 
  dmumps_par%ICNTL(2) = -1
  dmumps_par%ICNTL(3) = -1
  dmumps_par%ICNTL(4) =  0 !-1
  dmumps_par%ICNTL(7) =  5 
  !mumps_par%ICNTL(23) = 512
  !Call package for solution
  dmumps_par%JOB = JOB_ID 
  CALL DMUMPS(dmumps_par)
  !Destroy the instance (deallocate internal data structures)

return 
end subroutine dmumps_init


subroutine dmumps_solver (sparse_matrix, RHS, JOB_ID)
  use Sparse_Matrix_Type_H 
  use dmumps_module 
  IMPLICIT NONE
  type (sparse_matrix_type) :: sparse_matrix 
  real(kind=8),target :: RHS (sparse_matrix%DimNum)
  integer(kind=4) :: IERR
  integer(kind=4) :: JOB_ID 

  if ( dmumps_par % MYID == 0 ) then
     dmumps_par % N   =  sparse_matrix % DimNum 
     dmumps_par % NZ  =  sparse_matrix % NNZ  
     dmumps_par % IRN => sparse_matrix % IA 
     dmumps_par % JCN => sparse_matrix % JA 
     dmumps_par % A   => sparse_matrix % A 
     dmumps_par % RHS => RHS 
  end if
  !Call package for solution
  dmumps_par%JOB = JOB_ID
  CALL DMUMPS(dmumps_par)


  if (dmumps_par%INFO(1) /= 0) then 
      write(*,*) "An error occurred : MUMPS%INFO(1) = ", & 
                  dmumps_par%INFO(1)
  endif

  return       
end subroutine dmumps_solver 


!Destroy the instance (deallocate internal data structures)
subroutine dmumps_free ()
  use dmumps_module 
  implicit none 
  dmumps_par%JOB = -2
  call  DMUMPS(dmumps_par)

return 
end subroutine dmumps_free 


