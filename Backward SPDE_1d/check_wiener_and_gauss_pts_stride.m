function check_wiener_and_gauss_pts_stride ()
global k_dt 
global k_WienerValueStepSize
global k_WienerLineDiscreteNum
global k_RGaussPtsNum k_WGStrideNum

SX = linspace (-10, 10, k_WienerLineDiscreteNum);
StrideW = SX(2) - SX(1);
[RGaussPts, RGaussWts] = hermite_rule ( k_RGaussPtsNum ); 
 

dGauss = sqrt(k_dt) * max(abs(RGaussPts));


%% ************************************
%  0----x1-----x2------x3------x4----
%  0--------------MaxGAUSS-Pts--------


k_WGStrideNum = floor( dGauss / StrideW );


end 





