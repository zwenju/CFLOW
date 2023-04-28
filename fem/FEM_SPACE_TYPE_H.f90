module FEM_SPACE_TYPE_H



type  fem_space_type 

integer (kind=4) :: loc_basis_num 
integer (kind=4) :: loc_basis_num_1d 
integer (kind=4) :: loc_basis_num_2d 
integer (kind=4) :: loc_basis_num_3d

!!
!! the 1-dimension
!! 

real (kind = 8), allocatable :: ref_basis_1d (:,:)
real (kind = 8), allocatable :: ref_basis_dx_1d (:,:) 
real (kind = 8), allocatable :: ref_basis_dx2_1d (:,:) 

real (kind = 8), allocatable :: phy_basis_1d (:,:)
real (kind = 8), allocatable :: phy_basis_dx_1d (:,:) 
real (kind = 8), allocatable :: phy_basis_dx2_1d (:,:) 

!!
!! the 2-dimension 
!!
real (kind = 8), allocatable :: ref_basis_2d (:,:)
real (kind = 8), allocatable :: ref_basis_dx_2d (:,:) 
real (kind = 8), allocatable :: ref_basis_dx2_2d (:,:) 

real (kind = 8), allocatable :: phy_basis_2d (:,:)
real (kind = 8), allocatable :: phy_basis_dx_2d (:,:) 
real (kind = 8), allocatable :: phy_basis_dx2_2d (:,:) 


!!
!! the 3-dimension 
!!

real (kind = 8), allocatable :: ref_basis_3d (:,:)



end type 










end module FEM_SPACE_TYPE_H










