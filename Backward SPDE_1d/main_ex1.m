%%function main_1d
clc
close all
clear all 
global a b k_dt k_TimeStep
global  k_WienerValueStepSize
global  k_WienerLineDiscreteNum
global k_RGaussPtsNum
profile on


TimeStep = 10;
k_TimeStep = TimeStep;

k_dt = 0.0001;
k_RGaussPtsNum = 10;
WienerMax = 10;
WienerMin = -10;
k_WienerLineDiscreteNum = 2001;
k_WienerValueStepSize = (WienerMax - WienerMin) / k_WienerLineDiscreteNum;

check_wiener_and_gauss_pts_stride ()

a = 0; b = pi; N = 10;
FEM_set_femspace_info_1d;
iMidPts = (k_WienerLineDiscreteNum+1)/2;


for iMesh = 1 : 5
N = N * 2;

Mesh = FEM_create_mesh_1d( a, b, N );
Mesh = FEM_set_sparse_matrix_structure (Mesh);
Mesh = FEM_solve_system_parabolic_1d (Mesh, TimeStep);


%plot_parabolic_mesh ( Mesh, TimeStep * k_dt )
[L2(iMesh, 1:2), H1(iMesh, 1:2)] = FEM_calculate_parabolic_L2_H1_with_bspde (Mesh, 0, T_END, iMidPts)

HSIZE(iMesh) = 1 / N;

end 

Mesh.NodeList
Mesh.SU(:,iMidPts)
hold all 
plot( Mesh.NodeList', Mesh.SU(1:Mesh.NodeNum,iMidPts)  )
plot (Mesh.NodeList', sin (Mesh.NodeList'))

profile viewer