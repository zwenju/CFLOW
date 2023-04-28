function  value = user_parabolic_exact_solution_dx_1d (p, t, T_END, w)

x = p;

x = p;

u = exp(t - T_END) .* cos (x + w);

q = -exp(t - T_END) .* sin (x + w);
value = [u 
         q];
end