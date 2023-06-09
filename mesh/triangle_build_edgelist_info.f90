subroutine triangle_build_edgelist_info (Mesh)
!!$ ***************************************************************************************
!!$ Author :: WENJU ZHAO 
!!$ Email :: zwenju@outlook.com 
!!$Purposes:
!!$This routine based on the Quadratic elements generated by (triangle -pqo2) the 
!!$Two-Dimensional Quality Mesh Generator and Delaunay Triangulator.Jonathan Richard Shewchuk
!!$This routine re-orders the edgelist informations generated by the triangles.
!!$The edgelist is re-ordered based on the index of the midpoints of the edges.
!!$so that the fourth, fifth, sixth nodes index, can indicates both the nodes index and edge index
!!$meanwhile, the edge index is the same as the corresponding mid-point of the edge index 
!!$This intends to match the mesh of the weak Galerkin methods
!!$ ***************************************************************************************
!!$
  use Mesh_Type_H
  implicit none
  type(mesh_type) :: Mesh 
  integer(kind=4) :: e2(2), n3(3), n6(6), e_t
  integer(kind=4) :: iElement, iEdge
!!$
!!$ *************************************************
!!$          A3                            n3
!!$         / \                            / \  
!!$        / 3 \                          /   \
!!$       /     \                        /     \
!!$      C2------C1                     n5------n4
!!$     / \      /\                    / \      /\
!!$    /   \ 4  /  \                  /   \    /  \ 
!!$   /  1  \  / 2  \                /     \  /    \
!!$  /       \/      \              /       \/      \
!!$ A1-------C3-------A2           n1-------n6-------n2
!!$ *************************************************
!!$
  Mesh%EdgeNum = Mesh%NodeNum - Mesh%VertexNum

  allocate (Mesh%EdgeList (2, Mesh%EdgeNum))
  allocate (Mesh%EdgeBdryList (Mesh%EdgeNum))



  do iElement  = 1,  Mesh%ElementNum

     n6 =  Mesh%ElementList (1:6,  iElement)
     n3(1:3) = n6(4:6) - Mesh%VertexNum

     !!
     !! set the edgelist <endpoint, endpoints> 
     !!
     Mesh%EdgeList (1:2, n3(1)) = [n6(2), n6(3)]
     Mesh%EdgeList (1:2, n3(2)) = [n6(3), n6(1)]
     Mesh%EdgeList (1:2, n3(3)) = [n6(1), n6(2)]
     !!
     !! [boundary markers (0 or 1,2,...) ]
     !! set the edgelist marker list, the markers is the same as the markers of middle points
     !!
     Mesh%EdgeBdryList (n3(1)) = Mesh%NodeBdryList (n6(4))
     Mesh%EdgeBdryList (n3(2)) = Mesh%NodeBdryList (n6(5))
     Mesh%EdgeBdryList (n3(3)) = Mesh%NodeBdryList (n6(6))

  enddo
  !!
  !! re-order the edgelist for each component from small to large
  !!
  do iEdge =  1, Mesh%EdgeNum

     e2 =  Mesh%EdgeList (1:2, iEdge)

     if (e2(1) > e2(2)) then 
        !!
        !! swap the order such that e2(1) < e2(2)
        !!
        e_t = e2(1);  e2(1) = e2(2); e2(2) = e_t
        !!
        !! assign e2 to its position
        !!
        Mesh%EdgeList (1:2, iEdge) = e2
     endif
  enddo


  return 
end subroutine triangle_build_edgelist_info 




