subroutine solve_system ( Mesh, system_matrix  )
  use Mesh_Type_H
  use Sparse_Matrix_Type_H
  use dmumps_module 
  implicit none

  type (mesh_type) :: Mesh 
  type (sparse_matrix_type) :: system_matrix 
  real (kind=8),allocatable :: system_rhs (: )

  allocate( system_rhs (system_matrix % DimNum ))

  call assemble_system_matrix ( Mesh, system_matrix, system_rhs )
  call apply_boundary_condition (Mesh, system_matrix, system_rhs )

  !call sparse_matrix_write (system_matrix )

  call dmumps_init(system_matrix, 1)
  call dmumps_solver ( system_matrix, system_rhs, 5)
  call dmumps_free () 

  call save_mesh_solution ( Mesh, system_rhs )
  
  deallocate (system_rhs)
  return 
end subroutine solve_system





subroutine  assemble_system_matrix ( Mesh, system_matrix, system_rhs)
  use GLOBAL_INFO_H 
  use Mesh_Type_H
  use Sparse_Matrix_Type_H 
  implicit none
  type (mesh_type) :: Mesh 
  type (sparse_matrix_type) :: system_matrix 
  real (kind=8) :: system_rhs (system_matrix % DimNum )
  integer (kind=4) :: n6(6)
  integer (kind=4) :: idx(6), sidx (36)

  real (kind=8 ) :: local_matrix( fespace%loc_basis_num_2d, fespace%loc_basis_num_2d) 
  real (kind=8 ) :: local_rhs(1, 6), loc_rhs(1, 6)
  real (kind=8 ) :: t3(2,3) 
  real (kind=8 ), dimension ( fespace%loc_basis_num_2d, quadrature %quad_num_2d):: W, dx_basis, dy_basis 
  real (kind=8) :: rhs_w (1,  quadrature%quad_num_2d)
  integer (kind=4) :: iElement, iquad, ibasis 

  system_rhs  = 0.0d0 
  loop_element: do   iElement  = 1, Mesh%ElementNum

     n6 = Mesh%ElementList(1:6, iElement)
     t3 = Mesh%NodeList(1:2,  n6(1:3))


     call getLoc2GlobalIndex(Mesh%NodeNum, n6, idx)

     call t3_reference_to_physical_fem ( fespace, quadrature, t3 )


     !call quadrature_write (quadrature)

     forall (ibasis = 1 : fespace%loc_basis_num_2d )
        W( ibasis, : ) = quadrature % phy_quad_weights_2d 
     endforall

     dx_basis = fespace % phy_basis_dx_2d (:, 1: fespace%loc_basis_num_2d) 
     dy_basis = fespace % phy_basis_dx_2d (:, fespace%loc_basis_num_2d + 1: 2 * fespace%loc_basis_num_2d) 

     local_matrix =   matmul ( dx_basis * W,    transpose ( dx_basis ) ) & 
                   +  matmul ( dy_basis * W,    transpose ( dy_basis ) )


     call csr_submatrix_location_idx (system_matrix, idx, 6, idx, 6, sidx )
     call csr_submatrix_location_idx_unordered (system_matrix, idx, 6, idx, 6, sidx )

     system_matrix % A (sidx) =    system_matrix % A (sidx)  + reshape( local_matrix, [ 6 * 6])  

     call user_right_hand_sides ( quadrature%quad_num_2d,  quadrature%phy_quad_points_2d, loc_rhs )

     rhs_w (1, :) = quadrature % phy_quad_weights_2d 
     local_rhs = matmul ( loc_rhs * rhs_w, transpose (fespace % phy_basis_2d) )

     system_rhs ( idx ) = system_rhs ( idx ) +  local_rhs (1,:)


  enddo  loop_element



  return 
end subroutine assemble_system_matrix
