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
global  k_WienerValueStepSize
global  k_WienerLineDiscreteNum
global k_RGaussPtsNum



TimeStep = 40;
k_TimeStep = TimeStep;

k_dt = 0.00000001;

T_END = k_TimeStep  * k_dt;
k_RGaussPtsNum = 20;
WienerMax = 10;
WienerMin = -10;
k_WienerLineDiscreteNum = 10001;
k_WienerValueStepSize = (WienerMax - WienerMin) / k_WienerLineDiscreteNum;

check_wiener_and_gauss_pts_stride ()

a = 0; b = 1; N = 10;
FEM_set_femspace_info_1d;
iMidPts = (k_WienerLineDiscreteNum+1)/2;
WienerLinePts = linspace (-10, 10, k_WienerLineDiscreteNum);
MaxMeshLevel = 3
for iMesh = 1 : MaxMeshLevel
N = N * 2;

Mesh = FEM_create_mesh_1d( a, b, N );
Mesh = FEM_set_sparse_matrix_structure (Mesh);
Mesh = FEM_solve_system_parabolic_1d (Mesh, TimeStep);


%plot_parabolic_mesh ( Mesh, TimeStep * k_dt )
[L2(iMesh, 1:2), H1(iMesh, 1:2)] = FEM_calculate_parabolic_L2_H1_with_bspde (Mesh, 0, T_END, iMidPts)

HSIZE(iMesh) = 1 / N;

end 

subplot (1,2,1)
hold all 
plot( Mesh.NodeList', Mesh.SU(1:Mesh.NodeNum,iMidPts)  )
plot (Mesh.NodeList', sin (Mesh.NodeList'))

subplot (1,2,2)
hold all 
plot( Mesh.NodeList', Mesh.SU(Mesh.NodeNum+1:2*Mesh.NodeNum,iMidPts)  )
plot (Mesh.NodeList', cos (Mesh.NodeList'))


for iRate = 1 : MaxMeshLevel-1
   L2Rate (iRate, :)  = log ( L2(iRate, :) ./ L2(iRate+1,:) ) / log (2);
   H1Rate (iRate, :)  = log ( H1(iRate, :) ./ H1(iRate+1,:) ) / log (2);
    
end

L2
H1
L2Rate
H1Rate


iPts = WienerLinePts(iMidPts)









