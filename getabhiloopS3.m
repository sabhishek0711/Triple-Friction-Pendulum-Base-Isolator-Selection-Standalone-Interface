function [p1, p2, p3, p4, p5] = getabhiloopS3(Rvec, dvec, Hvec, muvec)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GETNICOLELOOPS3
% This will calculate the force-displacement loop for any 2-stage or
% 3-stage pendulum bearing.
% Created on 06/20/2012
% Last updated: 06/20/2012
% 
% Inputs:
%   1. Rvec: A 1x2 array containing the effective radii of the slider
%       concave, followed by the effective radii of the concave
%   2. dvec: A 1x4 array containing the plan diameter of the concave,
%       outer plan diameter of the slider concave, inner plan diameter of
%       the slider concave, and plan diameter of the inner slider.
%   3. Hvec: A 1x2 array containing the height of the inner slider,
%       followed by the height of the concave.
%   4. muvec: A 1x3 array containing the nominal friction vales in
%       ascending order.  The third value must be >= the second value.
% 
% Outputs:
%   1. p1: A 7x2 array.  The first column contains the x-coordinates of the
%       force-displacement loop up until the end of the first stage.  The
%       second column contains the y-coordinates of the force-displacement
%       loop up until the end of the first stage.
%   2. p2: A 10x2 array.  The first column contains the x-coordinates of the
%       force-displacement loop up until the end of the second stage.  The
%       second column contains the y-coordinates of the force-displacement
%       loop up until the end of the second stage.
%   3. p3: A 14x2 array.  The first column contains the x-coordinates of the
%       force-displacement loop up until the end of the third stage.  The
%       second column contains the y-coordinates of the force-displacement
%       loop up until the end of the third stage.
%   4. p4: A 16x2 array.  The first column contains the x-coordinates of the
%       force-displacement loop up until the end of the fourth stage.  The
%       second column contains the y-coordinates of the force-displacement
%       loop up until the end of the fourth stage.
%   5. p5: A 18x2 array.  The first column contains the x-coordinates of the
%       force-displacement loop up until the end of the fifth & final stage. The
%       second column contains the y-coordinates of the force-displacement
%       loop up until the end of the fifth & final stage.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Handling Inputs

% R1: radius of lower main concave
% R2: radius of lower slider concave
% R3: radius of upper slider concave
% R4: radius of upper main concave
% Rvec(1): radius of upper and lower slider concave
% Rvec(2): radius of upper main concave
% Rvec(3): radius of lower main concave
R2 = Rvec(1);
R3 = Rvec(1);
R1 = Rvec(3);
R4 = Rvec(2);

% d_concave: Plan diameter of concave
% d_slideroutside: Plan outer diameter of slider concave
% d_sliderinside: Plan inner diameter of slider concave
% d_inner: Plan diameter of inner slider
d_concave = dvec(1);
d_slideroutside = dvec(2);
d_sliderinside = dvec(3);
d_inner = dvec(4);

% H1: Height of inner slider
% H2: Height of concave
H1 = Hvec(1);
H2 = Hvec(2);

% mu1: friction of lower main concave surface
% mu2: fiction of lower slider concave surface
% mu3: fiction of upper slider concave surface
% mu4: fiction of upper main concave surface
% muvec(1): fiction of upper slider concave surface
% muvec(2): fiction of upper main concave surface
% muvec(3): friction of lower main concave surface
% muvec(4): fiction of lower slider concave surface
% (upper).  This value must be >= mu2.
mu3 = muvec(1);
mu4 = muvec(2);
mu1 = muvec(3);
mu2 = muvec(4);


%% Error Handling
% if mu3 < mu2
%     error('Error: mu3 must be >= mu2.  Check these values.');
% end

%% Calculation of Slopes

m1 = 2*R1 - H1;
m3 = 2*R2 - H2;
m2 = .5*(m1 + m3);

%% Calculation of Key Displacement Capacities

D_concave = (m3/(2*R2))*(d_concave - d_slideroutside);
D_sliderconcave = (m1/(2*R1))*(d_sliderinside - d_inner);

%% Calculating Maximum Displacement

D = D_concave + D_sliderconcave;

%% Calculation of Regime I

% Storing Values as Points
p1 = zeros(7, 2);
p1(1, :) = [0 0];
p1(2, :) = [0 mu1];
p1(3, :) = [(mu2 - mu1)*m1 mu2];
p1(4, :) = [(mu2 - mu1)*m1 mu2-2*mu1];
p1(5, :) = -p1(3, :);
p1(6, :) = -p1(4, :);
p1(7, :) = p1(3, :);

%% Calculation of Regime II

% Storing Values as Points
p2 = zeros(10, 2);
p2(1, :) = p1(1, :);
p2(2, :) = p1(2, :);
p2(3, :) = p1(3, :);
p2(4, :) = [(mu3-mu2)*m2+(mu2-mu1)*m1 mu3];
p2(5, :) = [p2(4,1) mu3-2*mu1];
p2(6, :) = [p2(4,1)-2*m1*(mu2-mu1) p2(5,2)-2*(mu2-mu1)];
p2(7, :) = -p2(4, :);
p2(8, :) = -p2(5, :);
p2(9, :) = -p2(6, :);
p2(10, :) = p2(4, :);

%% Calculation of Regime III

% Calculation of Displacements
D1 = (mu2 - mu1)*m1;
D2 = (mu3 - mu2)*m2 + D1;
D3 = D_concave + (mu3 - mu1)*m1 - (mu3 - mu2)*m2;
D4 = D3 - 2*m1*(mu2 - mu1);
D5 = D4 - 2*m2*(mu3 - mu2);

% Calculation of Forces
V1 = (1/m3)*(D3 - D2) + mu3;
V2 = V1 - 2*mu1;
V3 = V2 - 2*(mu2 - mu1);
V4 = V3 - 2*(mu3 - mu2);

% Storing Values as Points
p3 = zeros(14, 2);
p3(1, :) = [0 0];
p3(2, :) = [0 mu1];
p3(3, :) = [D1 mu2];
p3(4, :) = [D2 mu3];
p3(5, :) = [D3 V1];
p3(6, :) = [D3 V2];
p3(7, :) = [D4 V3]; % used to get P9 in Reg IV Calc
p3(8, :) = [D5 V4];
p3(9, :) = -p3(4, :);
p3(10, :) = -p3(5, :);
p3(11, :) = -p3(6, :);
p3(12, :) = -p3(7, :);
p3(13, :) = -p3(8, :);
p3(14, :) = p3(4, :);

%% Calculation of Regime IV

% Calculating Displacements
D6 = D3 + (mu3 - mu2)*m2;

% Calculating Forces
V5 = (1/m3)*(D3 - D2) + mu3;
V6 = (1/m2)*(D6 - D3) + V5;
V7 = V6 - 2*mu1;

% Calculating Additional Displacement and Force Values
D7 = (V7 - V3 + (1/m2)*D4 - (1/m1)*D6)/((1/m2) - (1/m1));
V8 = (1/m1)*(D7 - D6) + V7;

% Storing Values as Points
p4 = zeros(16, 2);
p4(1, :) = p3(1, :);
p4(2, :) = p3(2, :);
p4(3, :) = p3(3, :);
p4(4, :) = p3(4, :);
p4(5, :) = p3(5,:);
p4(6, :) = [D6 V6];
p4(7, :) = [D6 V7];
p4(8, :) = [D7 V8];
p4(9, :) = p3(8, :);
p4(10, :) = -p4(4, :);
p4(11, :) = -p4(5, :);
p4(12, :) = -p4(6, :);
p4(13, :) = -p4(7, :);
p4(14, :) = -p4(8, :);
p4(15, :) = -p4(9, :);
p4(16, :) = p4(4, :);

%% Calculation of Regime V

% Calculation of Forces
V8 = (1/m1)*(D - D6) + V6;
V9 = V8 - 2*mu1;

% Storing Values as Points
p5 = zeros(18, 2);
p5(1, :) = p4(1, :);
p5(2, :) = p4(2, :);
p5(3, :) = p4(3, :);
p5(4, :) = p4(4, :);
p5(5, :) = p4(5, :);
p5(6, :) = p4(6, :);
p5(7, :) = [D V8];
p5(8, :) = [D V9];
p5(9, :) = p4(8, :);
p5(10, :) = p4(9, :);
p5(11, :) = -p5(4, :);
p5(12, :) = -p5(5, :);
p5(13, :) = -p5(6, :);
p5(14, :) = -p5(7, :);
p5(15, :) = -p5(8, :);
p5(16, :) = -p5(9, :);
p5(17, :) = -p5(10, :);
p5(18, :) = p5(4, :);

end