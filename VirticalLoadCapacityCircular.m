function [tc, teff, Fbu, Mu, b1, ratio, r, Mus, Muext, Pu, Pallbuild, Pallbridge, Area, Pusi60, Pysi40, Pall_build, Pall_bridge, CF]=VirticalLoadCapacityCircular(dsi,Rmc,b,tmc,tb,fc,fy,thc,ths)

% dsi : diameter of the inner slider
% Rmc : Radius of main concave
% b  : Slider diameter
% tmc : central thickness of the main conave
% Fbu : Bearing Strength of Concrete base
% tc : Concave plate thickness at the edge of the slider
% tb : Base plate thickness
% fc : Nominal strength of concrete
% fy : Nominal strength of steel
% thc : Reduction factor in concrete
% ths : Reduction factor in steel
% CF : Correction Factor

% Acon : Confinement Area(unitless) i.e. sqrt(A2/A1)
% Mu : Moment resisted by (steel) main concave
% Mus : Simplified calculations for moment resistance
% Muext : Exact moment resistance calculations
% b1 : dimension of load distribution area
% ratio : ratio of b/b1
% rm : ratio of Muext/Mu
% Pu : Force resisted by the plain concrete
% Pusi60 : Load capacity of Inner Slider based on fy=60 ksi
% Pusi40 : Load capacity of Inner Slider based on fy=40 ksi
% Area : Plan area of inner slider

counter=0.25;

tc=tmc + Rmc - sqrt(Rmc^2 - (b/2)^2);
teff = sqrt(tc^2 + tb^2);
Acon = 2;
Fbu = thc*0.85*fc*Acon;
Mu = ths*fy*teff^2/4;

b1=b;
b1 = b1 + counter;
ratio=b/b1;
r=(b1 - b)/2;

% Approx interpolation calculation for CF
CF = 0.627*(ratio-0.25) + 0.6;
 if CF> 0.97
    CF=1;
 end

Mus = Fbu*(r^2)/2 + Fbu*((b1/b) - 1)*(r^2)/3;
Muext = CF*Mus;
rm = Muext/Mu;

 while ~(rm >= 0.9 && rm <= 1)
       b1= b1 + counter;
       ratio=b/b1;
       r=(b1 - b)/2;
       CF = 0.627*(ratio-0.25) + 0.6;
       if CF > 0.97
          CF=1;
       end
       
       Mus = Fbu*(r^2)/2 + Fbu*((b1/b) - 1)*(r^2)/3;
       Muext = CF*Mus;
       rm = Muext/Mu;
 end
 
 Pu = Fbu*pi*b1^2/4;
 
 % Calculation of Virtical Load from the Project for BUILDINGS
  Pallbuild = Pu/1.4;
  
  % Calculation of Virtical Load from the Project for BRIDGES
  Pallbridge = Pu/1.5;
  
 % Checking strength of inner slider
 Area = pi*dsi^2/4;
 Pusi60 = Area*60;  
 Pysi40 = Area*40;
 Pall_build = Area*20;
 Pall_bridge = Area*15;
end
