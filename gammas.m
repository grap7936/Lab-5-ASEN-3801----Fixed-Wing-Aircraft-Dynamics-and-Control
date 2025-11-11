function [Gamma_0, Gamma] = gammas(param)
%GAMMA Summary of this function goes here
%   Detailed explanation goes here

Ix = param.Ix;
Iy = param.Iy;
Iz = param.Iz;
Ixz = param.Ixz;


Gamma_0 = Ix * Iz - (Ixz)^2;

Gamma(1) = (Ixz * (Ix - Iy + Iz)) / Gamma_0;
Gamma(2) = (Iz * (Iz - Iy) + (Ixz)^2) / Gamma_0;
Gamma(3) = Iz / Gamma_0;
Gamma(4) = Ixz / Gamma_0;
Gamma(5) = (Iz - Ix) / Iy;
Gamma(6) = Ixz - Iy;
Gamma(7) = (Ix * (Ix - Iy) + (Ixz)^2) / Gamma_0;
Gamma(8) = Ix / Gamma_0;
Gamma(9) = Ix * Iz - Ixz^2;

end