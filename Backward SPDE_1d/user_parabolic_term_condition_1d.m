function  value = user_parabolic_term_condition_1d (p, t, T_END, w)

x = p;

u = exp(t - T_END) .* sin (x + w);

q = exp(t - T_END) .* cos (x + w);
value = [u 
         q];
end