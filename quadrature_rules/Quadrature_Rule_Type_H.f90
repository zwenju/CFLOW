module Quadrature_Rule_Type_H



type quadrature_rule_type 



!!
!! this for one dimensional edge integration
!!
Integer (kind=4) :: quad_num_1d


real(kind=8),allocatable :: ref_quad_points_1d  (:)
real(kind=8),allocatable :: ref_quad_weights_1d  (:)

real(kind=8),allocatable :: phy_quad_points_1d  (:)
real(kind=8),allocatable :: phy_quad_weights_1d  (:)

!!
!! this for two dimensional face integration
!! triangle or quadlateral 
!!
integer (kind=4) :: quad_num_2d
real(kind=8),allocatable :: ref_quad_points_2d  (:, :)
real(kind=8),allocatable :: ref_quad_weights_2d  (:)

real(kind=8),allocatable :: phy_quad_points_2d  (:, :)
real(kind=8),allocatable :: phy_quad_weights_2d  (:)





!!
!! this this for three dimensional volume integration
!! tetehedration 
!!

integer (kind=4) :: quad_num_3d
real(kind=8),allocatable :: ref_quad_points_3d  (:, :)
real(kind=8),allocatable :: ref_quad_weights_3d  (:)

real(kind=8),allocatable :: phy_quad_points_3d  (:, :)
real(kind=8),allocatable :: phy_quad_weights_3d  (:)


end type 





end module Quadrature_Rule_Type_H










