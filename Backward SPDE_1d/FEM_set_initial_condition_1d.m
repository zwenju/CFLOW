function  old_u = FEM_set_initial_condition_1d (Mesh)

 
old_u =  zeros(Mesh.NodeNum, 1);

for iElement  = 1 : Mesh.ElementNum
    
    n2 = Mesh.ElementList (1:2, iElement);
    t2 = Mesh.NodeList(:, n2);

    
    value = user_parabolic_initial_condition_1d (t2, 0);
    old_u (n2) = value;

end



end 
