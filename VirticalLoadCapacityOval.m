function [b1,b2]=VirticalLoadCapacityOval(dsi,dmc,Rmc,b,tmc,tb,fc,fy,thc,ths)

% dsi : diameter of inner slider
% dmc : diameter of the main concave
% Rmc : Radius of main concave
% b  : Slider diameter
% tmc : central thickness of the main conave
% t1 : Concave plate thickness at the inner end of slider concave (extreme displaced position)
% t2 : Concave plate thickness at the center of slider concave (extreme displaced position)
% tb : Base plate thickness
% fc : Nominal strength of concrete
% fy : Nominal strength of steel
% thc : Reduction factor in concrete
% ths : Reduction factor in steel
% CF1 : Correction Factor for b1
% CF2 : Correction Factor for b2

% Acon : Confinement Area(unitless) i.e. sqrt(A2/A1)
% Fbu : Bearing Strength of Concrete base
% Mu1 : Moment resisted by (steel) main concave at section t1
% Mu2 : Moment resisted by (steel) main concave at section t2
% Mus1 : Simplified calculations for moment resistance for b1
% Mus2 : Simplified calculations for moment resistance for b2
% Muext1 : Exact moment resistance calculations for b1 using CF1
% Muext2 : Exact moment resistance calculations for b2 using CF2
% b1 : dimension of load distribution area
% b2 : dimension of load distribution area on the other side
% ratio1 : ratio of b/b1
% ratio2 : ratio of b/b2
% rm1 : ratio of Muext1/Mu1
% rm2 : ratio of Muext2/Mu2
% Pu : Force resisted by the plain concrete
% Pusi60 : Load capacity of Inner Slider based on fy=60 ksi
% Pusi40 : Load capacity of Inner Slider based on fy=40 ksi
% Area : Plan area of inner slider

counter=0.25;

dist1 = dmc/2 - b;
dist2 = dmc/2 - b/2;
t1=tmc + Rmc - sqrt(Rmc^2 - (dist1)^2);
t2=tmc + Rmc - sqrt(Rmc^2 - (dist2)^2);
teff1 = sqrt(t1^2 + tb^2);
teff2 = sqrt(t2^2 + tb^2);
Acon = 2;
Fbu = thc*0.85*fc*Acon;
Mu1 = ths*fy*teff1^2/4;
Mu2 = ths*fy*teff2^2/4;

b1 = b;
b2 = b;
b1 = b1 + counter;
b2 = b2 + counter;
ratio1=b/b1;
ratio2=b/b2;
r1=(b1 - b)/2;
r2=(b2 - b)/2;

% Approx interpolation calculation for CF
CF1 = 0.627*(ratio1-0.25) + 0.6;
CF2 = 0.627*(ratio2-0.25) + 0.6;
 if CF1> 0.97
    CF1=1;
 end
 if CF2> 0.97
    CF2=1;
 end

Mus1 = Fbu*(r1^2)/2 + Fbu*((b1/b) - 1)*(r1^2)/3;
Mus2 = Fbu*(r2^2)/2 + Fbu*((b2/b) - 1)*(r2^2)/3;
Muext1 = CF1*Mus1;
Muext2 = CF2*Mus2;
rm1 = Muext1/Mu1;
rm2 = Muext2/Mu2;

 while ~(rm1 >= 0.9 && rm1 <= 1)
       b1 = b1 + counter;
       ratio1=b/b1;
       r1=(b1 - b)/2;
       CF1 = 0.627*(ratio1-0.25) + 0.6;
       if CF1> 0.97
          CF1=1;
       end
       
       Mus1 = Fbu*(r1^2)/2 + Fbu*((b1/b) - 1)*(r1^2)/3;
       Muext1 = CF1*Mus1;
       rm1 = Muext1/Mu1;
 end
 
 while ~(rm2 >= 0.9 && rm2 <= 1)
       b2 = b2 + counter;
       ratio2=b/b2;
       r2=(b2 - b)/2;
       CF2 = 0.627*(ratio2-0.25) + 0.6;
       if CF2> 0.97
          CF2=1;
       end
       
       Mus2 = Fbu*(r2^2)/2 + Fbu*((b2/b) - 1)*(r2^2)/3;
       Muext2 = CF2*Mus2;
       rm2 = Muext2/Mu2;
 end
 
 Pu = Fbu*pi*b1*b2/4;
 
 % Calculation of Virtical Load from the Project for BUILDINGS
 Pallbuild = Pu/1.4;
  
 % Calculation of Virtical Load from the Project for BRIDGES
 Pallbridge = Pu/1.5;
 
 % Checking strength of inner slider
 Area = pi*dsi^2/4;
 Pusi60 = Area*60;  
 Pusi40 = Area*40;
end
