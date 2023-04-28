function  value = user_parabolic_initial_condition_1d (p, t)

x = p;

value = ...
cos(4.*t.*pi) + cos(4.*x.*pi);
end