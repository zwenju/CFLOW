subroutine triangle_write_mesh (Mesh)
  use Mesh_Type_H
  implicit none
  type(mesh_type),intent(in) :: Mesh 
  integer(kind=4) :: iNode, iElement  
 
  write (*,*) "~~~~~~~~~~~~begin write mesh ~~~~~~~~~~~~~~~~~~~~~"
  write (*,*) "~~~~~~~~~~~~ NodeList ~~~~ NodeNum = ", Mesh%NodeNum, "~~~~~~~~~~~~~" 

  NodeList_loop : do iNode = 1, Mesh%NodeNum
     write(*,*) iNode, " : ", Mesh%NodeList(1:2, iNode), Mesh%NodeBdryList(iNode)
  enddo NodeList_loop

  write (*,*) "  "
  write (*,*) " ~~~~~~~~~~~~ ElementList ~~~~ElementNum = ", Mesh%ElementNum, "~~~~~~~~~~~~"

  ElementList_loop : do iElement = 1, Mesh%ElementNum 
     write(*,*) iElement,  ":" , Mesh%ElementList(1:6, iElement)
  enddo ElementList_loop

  write (*,*) "VertexNum     = ", Mesh%VertexNum 
  write (*,*) "NodeNum       = ", Mesh%NodeNum 
  write (*,*) "ElementNum    = ", Mesh%ElementNum 
  write (*,*) "~~~~~~~~~~~~~~~ end write mesh ~~~~~~~~~~~~~~~~~~~"
  
  return 
end subroutine triangle_write_mesh 
