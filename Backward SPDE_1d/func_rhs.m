function [val] = func_rhs(x)
global epsilon v
val = ...
epsilon*sin(x) + v*cos(x);

val = 0 * x.^0;

end 