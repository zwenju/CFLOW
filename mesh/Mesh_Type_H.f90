module Mesh_Type_H 
implicit none 


type  mesh_type

integer(kind=4) :: RegionDimension = 2 
integer(kind=4) :: RegionHolesNum  = 0




integer(kind=4) :: VertexNum
integer(kind=4) :: NodeNum
integer(kind=4) :: ElementNum
integer(kind=4) :: EdgeNum 
integer(kind=4) :: FaceNum


integer(kind=4) :: DimNum


real(kind=8),allocatable    :: NodeList(:,:)
integer(kind=4),allocatable :: ElementList(:,:)


integer(kind=4),allocatable :: NodeBdryList(:)

integer(kind=4),allocatable :: EdgeList (:,:)
integer(kind=4),allocatable :: EdgeBdryList(:)

integer (kind=4),allocatable  :: FaceList(:,:)




end type 



end module Mesh_Type_H



