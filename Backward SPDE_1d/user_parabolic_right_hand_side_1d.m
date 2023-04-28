function  value = user_parabolic_right_hand_side_1d (p, t)

x = p;
value = ...
16.*pi.^2.*cos(4.*x.*pi) - 4.*pi.*sin(4.*t.*pi);
end
