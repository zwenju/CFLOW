subroutine  memory_report_r8( r8_num )
!!$ *******************************
!!$ bool  : 1 bytes
!!$ char  : 1 bytes
!!$ short : 2 bytes
!!$ int   : 4 bytes
!!$ long  : 8 bytes
!!$ float : 4 bytes
!!$ double: 8 bytes
!!$ long double  : 16 bytes
!!$ unsigned int : 8 bytes
!!$ unsigned char: 1 bytes
!!$ long int     : 8 bytes
!!$ short int    : 2 bytes
!!$ signed char  : 1bytes
!!$ *******************************
!!$ To consider the overflow or underflows the r8_num is limited in  
!!$ INT_MIN Minimum value for a variable of type int. –2147483648
!!$ INT_MAX Maximum value for a variable of type int.  2147483647
!!$ **********************************************
implicit none
integer (kind=4) :: r8_num
real (kind=8) :: byte, kilobyte, megabyte, gigabyte 

byte     = r8_num * 8.0d0 
kilobyte = byte / 1024 
megabyte = kilobyte / 1024
gigabyte = megabyte / 1024


write (*, *) "The memory comsumption = "
write (*, *) "MegaByte = ", megabyte 
write (*, *) "GigaByte = ", gigabyte 
write (*, *) "  "



return 
end subroutine 





