!> This main function is disigned to compute the space convergence rate
!! the parallel version of MUMPS package are used
!! the routine using exact solution to the the true 
!!===================================================================
program main
  use Mesh_Type_H
  implicit none 

  character(len=200) :: file_name 
  character(len = 10) :: I_String 
  type(mesh_type) :: Mesh(10) 
  integer(kind=4) :: iMesh 

  file_name = "triangle/cylinder.1"
  !file_name = "output/mesh_1"
 
  call triangle_read_mesh ( file_name, Mesh(1) )
  call triangle_write_mesh (Mesh)

  call  triangle_build_edgelist_info (Mesh)


  do iMesh  = 1, 3
  

  call triangle_uniform_refinement (Mesh(iMesh), Mesh(iMesh+1))
  call triangle_write_mesh ( Mesh(iMesh) )

  write (I_String, '(I10)')  iMesh  
  file_name = "output/mesh_" //  trim ( ADJUSTL( I_String) )
  call triangle_save_mesh ( Mesh(iMesh), file_name )

  file_name = "output/mesh_py_" //  trim ( ADJUSTL(I_String) )
  call triangle_save_mesh_py ( Mesh(iMesh), file_name )

   
  enddo 




  return
end program main
