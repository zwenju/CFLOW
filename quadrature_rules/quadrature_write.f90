subroutine quadrature_write ( quadrature )
  use Quadrature_Rule_Type_H
  implicit none

  type (quadrature_rule_type) :: quadrature 
  integer (kind=4) :: I 


  if (allocated ( quadrature%ref_quad_points_1d)) then 

     write (*,*) "Quadrature Rule in 1D, quad num = ", quadrature % quad_num_1d
     write (*,*) "ref : ", " ref_x ",  " ref_w ",  " phy : ", " phy_x ", " phy_w "

     do I = 1, quadrature% quad_num_1d

        write (*,*) I, "ref : ", quadrature%ref_quad_points_1d(I),  quadrature%ref_quad_weights_1d(I), &
                       "phy : ", quadrature%phy_quad_points_1d(I),  quadrature%phy_quad_weights_1d(I)

     enddo


  elseif (allocated (quadrature%ref_quad_points_2d)) then 

     write (*,*) "Quadrature Rule in 2D, quad num = ", quadrature % quad_num_2d
     write (*,*) "ref : ", " ref_x1, ref_x2 ",  " ref_w ",  " phy : ", " phy_x1, phy_x2 ", " phy_w "

     do I = 1, quadrature% quad_num_2d

        write (*,*) I, "ref : ", quadrature%ref_quad_points_2d(:, I),  quadrature%ref_quad_weights_2d(I), &
                       "phy : ", quadrature%phy_quad_points_2d(:, I),  quadrature%phy_quad_weights_2d(I)

     enddo

  elseif (allocated (quadrature%ref_quad_points_3d)) then 

     write (*,*) "Quadrature Rule in 3D, quad num = ", quadrature % quad_num_3d
     write (*,*) "ref : ", " ref_x1, ref_x2, ref_x3 ",  " ref_w ",  " phy : ", " phy_x1, phy_x2, phy_x3 ", " phy_w "

     do I = 1, quadrature% quad_num_3d

        write (*,*) I, "ref : ", quadrature%ref_quad_points_3d(:, I),  quadrature%ref_quad_weights_3d(I), &
                       "phy : ", quadrature%phy_quad_points_3d(:, I),  quadrature%phy_quad_weights_3d(I)

     enddo

  endif


  return 
end subroutine quadrature_write
