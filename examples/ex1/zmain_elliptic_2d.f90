program  zmain_elliptic_2D
  use GLOBAL_INFO_H 
  use Mesh_Type_H
  use Sparse_Matrix_Type_H
  use dmumps_module 
  implicit none

  character (len=100) :: mesh_file_name  
  type (mesh_type) :: Mesh(6) 
  type (sparse_matrix_type) :: system_matrix 
  integer (kind=4) :: iERR, iMesh 


  CALL MPI_INIT(IERR)


  mesh_file_name = "../mesh/square/box.0"
  call triangle_read_mesh(mesh_file_name, Mesh(1))  

  mesh_file_name = "../mesh/square/box.6"
  !call triangle_read_mesh(mesh_file_name, Mesh(2))  

  call set_quadrature_fespace ( )




  do iMesh = 2, 3
     call triangle_uniform_refinement ( Mesh(iMesh-1), Mesh(iMesh) )

     call triangle_save_mesh_py(Mesh(iMesh), "mesh_test")

     write (*,*) "iMesh = ", iMesh 
     call make_coo_sparsity_pattern ( Mesh(iMesh), system_matrix )

     !call sparse_matrix_write (system_matrix)



     call solve_system ( Mesh(iMesh), system_matrix  )

     call sparse_matrix_free (system_matrix )  

  enddo



  CALL MPI_FINALIZE(IERR)


end program zmain_elliptic_2D





