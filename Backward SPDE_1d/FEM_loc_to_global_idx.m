function idx = FEM_loc_to_global_idx (Mesh, n2)

NodeNum = Mesh.NodeNum;

idx = [n2', NodeNum + n2' ];


end 



