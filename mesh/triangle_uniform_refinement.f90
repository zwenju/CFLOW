subroutine triangle_uniform_refinement (Mesh, RefineMesh)
!!$ ***************************************************************************************
!!$ Author :: WENJU ZHAO 
!!$ Email :: zwenju@outlook.com 
!!$ Punew_pose :
!!$ Var : refined-[VertexNum, NodeNum, ElementNum, ElementList, NodeList, NodeBdryList]
!!$ this routine can generate the new refined (ElementList, NodeList, NodeBdryList)
!!$ To refine the mesh based on the quadratic mesh generated by the triangle software
!!$ the new node indices are ordered  [ Mesh%NodeList,    2 * Mesh%Edgelist, 3 * Mesh%ElementList    ] 
!!$ for each element, the new added nodes are listed as the following node
!!$  
!!$ First assume that the mesh is already delaunary, by linking the mid-points on the edges,
!!$ one element is uniformlly divided into four elements 
!!$ ****************************************************************************************
!!$
  use Mesh_Type_H
  implicit none
  type(mesh_type),intent(in)    :: Mesh
  type(mesh_type),intent(inout) :: RefineMesh
  integer(kind=4) :: n6(6), n3(3), new_e(6, 4)
  
  real(kind=8) :: old_p(2,6), new_p(2,9)
  integer(kind=4) :: new_n9_idx(9)
  integer(kind=4) :: Mesh_EdgeNum 
  integer(kind=4) :: iElement 
!!$
!!$ ****************************************************************************************
!!$            A1                                    n3
!!$           /  \                                  /  \
!!$          /    \                 new_n9_idx(3):p3    \p2:new_n9_idx(2)
!!$         /  3   \                              /  3   \
!!$        /        \                            /        \
!!$       C2---------C1                        n5----p9----n4
!!$      / \         /\                        / \        / \
!!$     /   \   4   /  \                      /   \  4   /   \ 
!!$    /  1  \     / 2  \     new_n9_idx(4):p4     p7   p8    \p1:new_n9_idx(1)
!!$   /       \   /      \                  /  1    \  /  2    \
!!$  /         \ /        \                /         \/         \
!!$ A1---------C3----------A2            n1----p5----n6----p6---- n2
!!$                                  new_n9_idx(5)  new_n9_idx(6)
!!$                                r1:new_n9_idx(7), r2:new_n9_idx(8), r3:new_n9_idx(9)  
!!$ ****************************************************************************************
!!$


  !!
  !! set the RefineMesh NodeNum and ElementNum, then allocate the memory for them 
  !!
  Mesh_EdgeNum = Mesh%NodeNum - Mesh%VertexNum 
  RefineMesh%VertexNum  = Mesh%NodeNum
  RefineMesh%NodeNum    = Mesh%NodeNum +  3 * Mesh%ElementNum + 2 * Mesh_EdgeNum
  RefineMesh%ElementNum = 4 * Mesh%ElementNum
  RefineMesh%EdgeNum    = RefineMesh%NodeNum - RefineMesh%VertexNum 
  !!
  !! allocate the NodeList, NodeBdryList, ElementList 
  !!
  allocate(RefineMesh%NodeList ( 2, RefineMesh%NodeNum) )
  allocate(RefineMesh%NodeBdryList (RefineMesh%NodeNum) )
  allocate(RefineMesh%ElementList (6, RefineMesh%ElementNum) )
  !!
  !! assign the previous mesh the refine mesh, the orginal nodelist is kept as orginal.
  !!
  RefineMesh%NodeList (1:2, 1:Mesh%NodeNum) = Mesh%NodeList
  RefineMesh%NodeBdryList ( 1:Mesh%NodeNum) = Mesh%NodeBdryList
!!$
!!$ *****************************************************
!!$
  do iElement =  1, Mesh%ElementNum 

     n6 = Mesh%ElementList(1:6, iElement)  
     old_p = Mesh%NodeList (1:2,  n6)
     n3 (1:3)  = n6 (4:6) - Mesh%VertexNum 
     !!
     !! the new generated points :  the order is strictly following the above triangle graph
     !!
     new_p(1:2, 1)  =  old_p(1:2, 2) + old_p(1:2, 4)
     new_p(1:2, 2)  =  old_p(1:2, 4) + old_p(1:2, 3)
     new_p(1:2, 3)  =  old_p(1:2, 3) + old_p(1:2, 5)
     new_p(1:2, 4)  =  old_p(1:2, 5) + old_p(1:2, 1)
     new_p(1:2, 5)  =  old_p(1:2, 1) + old_p(1:2, 6)
     new_p(1:2, 6)  =  old_p(1:2, 6) + old_p(1:2, 2)
     new_p(1:2, 7)  =  old_p(1:2, 5) + old_p(1:2, 6)
     new_p(1:2, 8)  =  old_p(1:2, 6) + old_p(1:2, 4)
     new_p(1:2, 9)  =  old_p(1:2, 4) + old_p(1:2, 5)
     new_p = 0.50d0 * new_p

     !! write (*,*) " n3 = ", n3 
     !! write (*,*) "new_p ", new_p(1, :)
     !! write (*,*) "new_p ", new_p(2, :)

     !!
     !! the global index of the new points 
     !!
     !! here we need to consider the order of edge (very important)
     
     !! Edge 1
     if (n6(2) <  n6(3) ) then 
     new_n9_idx (1:2) = Mesh%NodeNum + 2 * (n3(1) - 1)   + [1, 2]
     else 
     new_n9_idx (1:2) = Mesh%NodeNum + 2 * (n3(1) - 1)   + [2, 1]
     endif 

     !! Edge 2
     if (n6(3) < n6(1) ) then 
     new_n9_idx (3:4) = Mesh%NodeNum + 2 * (n3(2) - 1)   + [1, 2]
     else 
     new_n9_idx (3:4) = Mesh%NodeNum + 2 * (n3(2) - 1)   + [2, 1]
     endif 

     !1 Edge 3
     if (n6(1) < n6(2) ) then 
     new_n9_idx (5:6) = Mesh%NodeNum + 2 * (n3(3) - 1)   + [1, 2]  
     else 
     new_n9_idx (5:6) = Mesh%NodeNum + 2 * (n3(3) - 1)   + [2, 1]  
     endif 
      

   
     new_n9_idx (7:9) = Mesh%NodeNum + 2 * Mesh_EdgeNum  + 3 * (iElement-1)  + [1,2,3]
     !!
     !! the new element (n6) indices : the order is strictly same as the above triangle graph
     !!
     new_e(1:6, 1) = [n6(1), n6(6), n6(5), new_n9_idx(7), new_n9_idx(4), new_n9_idx(5)]
     new_e(1:6, 2) = [n6(6), n6(2), n6(4), new_n9_idx(1), new_n9_idx(8), new_n9_idx(6)]
     new_e(1:6, 3) = [n6(5), n6(4), n6(3), new_n9_idx(2), new_n9_idx(3), new_n9_idx(9)]
     new_e(1:6, 4) = [n6(6), n6(4), n6(5), new_n9_idx(9), new_n9_idx(7), new_n9_idx(8)]

     !!
     !! ************************************************************************
     !! set the new refine mesh (1 element to 4 elements)  
     !!
     RefineMesh%ElementList (1:6,  4*(iElement-1) + [1,2,3,4] ) = new_e
     !!
     !! set the new nodes to the refined mesh list 
     !!
     RefineMesh%NodeList (1:2, new_n9_idx) = new_p
     !!
     !! the new six edges markers 
     !!
     RefineMesh%NodeBdryList ( new_n9_idx (1:2) ) = Mesh%NodeBdryList ( n6(4) ) 
     RefineMesh%NodeBdryList ( new_n9_idx (3:4) ) = Mesh%NodeBdryList ( n6(5) ) 
     RefineMesh%NodeBdryList ( new_n9_idx (5:6) ) = Mesh%NodeBdryList ( n6(6) )

     !! the node markers inside of the element is always beyond the boundary
     !! non-boundary node is markered as 0 
     RefineMesh%NodeBdryList ( new_n9_idx (7:9) ) = 0 

  enddo

  return 
end subroutine triangle_uniform_refinement 




