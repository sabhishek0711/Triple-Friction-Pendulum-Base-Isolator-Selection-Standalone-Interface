function [q1,q2,q3,q4,q5,q6,c1,c2,c3,c4,c5,c6,P1,P2,P3,P4,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10]=ToScaleDrawing_section(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer,dsi,Ht,Hs, Rsc_outer, scr_radius)


% q1 and q5 plots the upper and the lower main concave respectively
q1(1,:) = [0   hsi/2 + tsc];
q1(2,:) = [dmc/8   q1(1,2) - Rmc + sqrt(Rmc^2 - (dmc/8)^2)];
q1(3,:) = [dmc/4   q1(1,2) - Rmc + sqrt(Rmc^2 - (dmc/4)^2)];
q1(4,:) = [3*dmc/8   q1(1,2) - Rmc + sqrt(Rmc^2 - (3*dmc/8)^2)];
q1(5,:) = [dmc/2   q1(1,2) - Rmc + sqrt(Rmc^2 - (dmc/2)^2)];
q1(6,:) = [dmc/2   q1(5,2) - 0.5];
q1(7,:) = [dmc_outer/2   q1(6,2)];
q1(8,:) = [q1(7,1)  q1(1,2)];
q1(9,:) = [q1(7,1)+0.5     q1(1,2)];
q1(10,:) = [q1(9,1)   q1(9,2) + tmc];
q1(11:20,:) = [-q1(10:-1:1,1)  q1(10:-1:1,2)];


q5 = [q1(:,1) -q1(:,2)];


% q2 & q4 plots the upper and lower slider concaves respectively
    if dsc < dsc_outer

            q2(1,:) = [0   hsi/2];
            q2(2,:) = [dsc/8      q2(1,2) - Rsc + sqrt(Rsc^2 - (dsc/8)^2)];
            q2(3,:) = [dsc/4      q2(1,2) - Rsc + sqrt(Rsc^2 - (dsc/4)^2)];
            q2(4,:) = [3*dsc/8    q2(1,2) - Rsc + sqrt(Rsc^2 - (3*dsc/8)^2)];
            q2(5,:) = [dsc/2      q2(1,2) - Rsc + sqrt(Rsc^2 - (dsc/2)^2)];
            q2(6,:) = [q2(5,1)  q2(5,2)-0.2];
            q2(7,:) = [dsc_outer/2  q2(6,2)];
            q2(8,:) = [q2(7,1)    q1(1,2) - Rmc + sqrt(Rmc^2 - ((dsc_outer/2)^2))];
            q2(9,:) = q1(1,:);
            q2(10:17,:) = [-q2(8:-1:1,1)   q2(8:-1:1,2)];

            q4 = [q2(:,1) -q2(:,2)];
    else

            q2(1,:) = [0           hsi/2];
            q2(2,:) = [dsc/8       hsi/2 - Rsc + sqrt(Rsc^2 - (dsc/8)^2)];
            q2(3,:) = [dsc/4       hsi/2 - Rsc + sqrt(Rsc^2 - (dsc/4)^2)];
            q2(4,:) = [3*dsc/8     hsi/2 - Rsc + sqrt(Rsc^2 - (3*dsc/8)^2)];
            q2(5,:) = [dsc/2       hsi/2 - Rsc + sqrt(Rsc^2 - (dsc/2)^2)];

            % sketching the arcs at the tips of the slider concave
            x = dsc/2:scr_radius/2:(dsc/2 + 2*scr_radius);
            y = -sqrt(scr_radius^2 - (x - (dsc/2 + scr_radius)).^2) + q2(5,2);

            q2(6:10,:) = [x'  y']; 
            q2(11,:) = [dsc_outer/2    Hs/2 - Rsc_outer + sqrt(Rsc_outer^2 - (dsc_outer/2)^2)];
            q2(12,:) = [dsc_outer/4   Hs/2 - Rsc_outer + sqrt(Rsc_outer^2 - (dsc_outer/4)^2)];
            q2(13,:) = [0   Hs/2];
            q2(14:25,:) = [-q2(12:-1:1,1)    q2(12:-1:1,2)];

            q4 = [q2(:,1)    -q2(:,2)];

    end


% q3 and q6 plots the right and the left virtical lines of the inner slider
% respectively
q3(1,:) = [dsi/2  hsi/2 - Rsc + sqrt(Rsc^2 - (dsi/2)^2)];
q3(2,:) = [dsi/2  -(hsi/2 - Rsc + sqrt(Rsc^2 - (dsi/2)^2))];

q6(1,:) = [-q3(1,1) q3(1,2)];
q6(2,:) = [-q3(2,1) q3(2,2)];


%% Labelling Coordinates


c1(1,:) = [-dmc_outer/2 - 1    -Ht/2];
c1(2,:) = [-dmc_outer/2 - 4   c1(1,2)];
c1(3,:) = [-dmc_outer/2 - 2.5     c1(1,2)];
c1(4,:) = [c1(3,1)              Ht/2];
c1(5,:) = [c1(1,1)    c1(4,2)];
c1(6,:) = [c1(2,1)    c1(4,2)];

c2(1,:) = [-dmc_outer/2     Ht/2 + 0.5];
c2(2,:) = [-dmc_outer/2     Ht/2 + 5.5];
c2(3,:) = [-dmc_outer/2     Ht/2 + 5];
c2(4,:) = [dmc_outer/2      Ht/2 + 5];
c2(5,:) = [dmc_outer/2      Ht/2 + 0.5];
c2(6,:) = [dmc_outer/2      Ht/2 + 5.5];

c3(1,:) = [-dsc_outer/2     Ht/2 + 0.5];
c3(2,:) = [-dsc_outer/2     Ht/2 + 2.5];
c3(3,:) = [-dsc_outer/2     Ht/2 + 1.5];
c3(4,:) = [dsc_outer/2      Ht/2 + 1.5];
c3(5,:) = [dsc_outer/2      Ht/2 + 0.5];
c3(6,:) = [dsc_outer/2      Ht/2 + 2.5];

c4(1,:) = [-dsi/2         -Ht/2 - 0.5];
c4(2,:) = [-dsi/2         -Ht/2 - 3.5];
c4(3,:) = [-dsi/2         -Ht/2 - 2];
c4(4,:) = [dsi/2          -Ht/2 - 2];
c4(5,:) = [dsi/2          -Ht/2 - 0.5];
c4(6,:) = [dsi/2          -Ht/2 - 3.5];

c5(1,:) = [dsc_outer/2 + 3     -hsi/2];
c5(2,:) = [dsc_outer/2 + 3      hsi/2];

c6(1,:) = [dsc_outer/2 + 7      -Hs/2];
c6(2,:) = [dsc_outer/2 + 7       Hs/2];


P1=[q1(15,1) - 1      -Ht/2 - 3];
P2=[q5(15,1) - 2      q5(15,2) - Hs/2];
P3=[0    0];
P4=[q4(2,1) + 4      q4(2,2) - tsc - tmc - 6];

%% Inserting Texts

T1 = [c1(2,1)-2.2 0];
T2 = [0   c2(3,2) + 1];
T3 = [0   c3(3,2) + 1];
T4 = [0   c4(3,2) - 1];
T5 = [c5(1,1) + 2, 0];
T6 = [c6(1,1) + 2, 0];
T7 = [P1(1) + 2  P1(2) - 1.5];
T8 = [P3(1) P3(2) - 0.5];
T9 = [P4(1) P4(2) - 0.5];
T10 = [dmc_outer/2 + 7.5   Ht/2 - 1];




end