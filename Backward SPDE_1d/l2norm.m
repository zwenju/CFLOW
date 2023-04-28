function l2 = l2norm(v)

 N = length(v);
 l2 = sqrt ( sum( v.* v )  / N );  

end