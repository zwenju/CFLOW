%%function main_1d
%%function main_1d
%%
%%
%% 研究结果尚未完成，因此部分代码处于加密状态，
%% 此后，代码和研究结果会一起发布
%% 
%% 如有感兴趣的读者，可提前联系作者获取FULL VERSION
%% 可以联系 zhaowj@sdu.edu.cn
%% 谢谢理解，支持
%%

close all
clear all 
global a b 
global epsilon v
 
epsilon = 0.0001;
v = 0.01;
a = 0;
b = 1;
N = 10;
FEM_set_femspace_info_1d;

Mesh = FEM_create_mesh_1d( a, b, N );
Mesh = FEM_set_sparse_matrix_structure (Mesh);



Mesh = FEM_solve_system_elliptic_1d (Mesh);
plot_mesh ( Mesh )

[L2, H1] =  FEM_calculate_L2_H1_with_exact_sol (Mesh)



