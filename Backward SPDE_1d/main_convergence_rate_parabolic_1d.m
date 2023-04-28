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
clc
close all
clear all 
global a b k_dt k_TimeStep
global WienerValueStepSize
global  WienerLineDiscreteNum
global RGaussPtsNum

TimeStep = 10;
k_TimeStep = TimeStep;

k_dt = 0.001;
RGaussPtsNum = 10;
WienerMax = 10;
WienerMin = -10;
WienerLineDiscreteNum = 11;
WienerValueStepSize = (WienerMax - WienerMin) / WienerLineDiscreteNum;



check_wiener_and_gauss_pts_stride ()

a = 0; b = 1; N = 10;
FEM_set_femspace_info_1d;



for iMesh = 1 : 6
N = N * 2;

Mesh = FEM_create_mesh_1d( a, b, N );
Mesh = FEM_set_sparse_matrix_structure (Mesh);

Mesh = FEM_solve_system_parabolic_1d (Mesh, TimeStep);


%plot_parabolic_mesh ( Mesh, TimeStep * k_dt )
%[L2(iMesh), H1(iMesh)] = FEM_calculate_parabolic_L2_H1_with_exact_sol (Mesh, TimeStep * k_dt)

HSIZE(iMesh) = 1 / N;

end 










