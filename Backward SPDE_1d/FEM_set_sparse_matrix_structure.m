function Mesh = FEM_set_sparse_matrix_structure (Mesh)

loc_basis_num = 2;

loc_mat = ones(4,4);
system_matrix = sparse (Mesh.DimNum, Mesh.DimNum);
for iElement = 1 : Mesh.ElementNum
    
    n2 = Mesh.ElementList(1:2, iElement);
    idx = FEM_loc_to_global_idx (Mesh, n2);
    system_matrix( idx, idx )  =  loc_mat;
    
end
[Mesh.SpMat_I, Mesh.SpMat_J, Mesh.SpMat_V] = find (system_matrix);
Mesh.SpMat_V = zeros(size(Mesh.SpMat_V));
end