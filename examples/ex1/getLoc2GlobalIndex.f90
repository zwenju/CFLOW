subroutine getLoc2GlobalIndex(NodeNum, n6, idx)
implicit none
integer (kind=4), intent (in) :: NodeNum 
integer (kind=4), intent (in) :: n6(6)
integer (kind=4), intent (out) :: idx(6)


idx = n6 


return 
end subroutine 
