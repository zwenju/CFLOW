program memory_check_r8_test
implicit none
integer (kind=4) :: infinity 
integer (kind=4) :: DimNum, TimeLevel 
integer (kind=4) :: NNZ 



infinity = huge (1)


DimNum = 500000
TimeLevel = 1000






NNZ  = DimNum * TimeLevel

!!
!!  check overflow or not 
!! 
if ( NNZ  <  infinity ) then 

write (*, *) "The maximun size = ", infinity 
write (*,*) "The array size = ", NNZ 
call memory_report_r8( NNZ )

else 

write (*,*) "it is overflow "

endif  







return 
end program 
