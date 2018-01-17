function [archx,pl,pl1,pl2,pl3,pl4,cirprop,c1,c2,c3,c4,c5,c6,c7,T1,T2,T3,T4,T5,T6,T7,T8,sp1,sp2,sp3,sp4] = ToScaleDrawing_plan(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, edge_dim_mc, flange_radius, center_hole, corner_hole)

   
    if flange_radius ~= 0
        
        edge_dim_mc = sqrt(flange_radius^2 - (dmc_outer/2 + 0.25)^2);
        
        archx(1,:) = [edge_dim_mc   dmc_outer/2 + 0.25];
        archx(2,:) = [-dmc_outer/2 - 0.25 -edge_dim_mc];
        
        pl1(1,:) = [dmc_outer/2 + 0.25  edge_dim_mc];
        pl1(2,:) = [dmc_outer/2 + 0.25 -edge_dim_mc];
        
        pl2(1,:) = [-dmc_outer/2 - 0.25   edge_dim_mc];
        pl2(2,:) = [-dmc_outer/2 - 0.25  -edge_dim_mc];
        
        pl3(1,:) = [edge_dim_mc     dmc_outer/2 + 0.25];
        pl3(2,:) = [-edge_dim_mc    dmc_outer/2 + 0.25];
        
        pl4(1,:) = [edge_dim_mc     -dmc_outer/2 - 0.25];
        pl4(2,:) = [-edge_dim_mc    -dmc_outer/2 - 0.25];
        
        pl = [0 0];
        
    else
        archx(1,:) = [0   0];
        archx(2,:) = [0   0];
        
        pl(1,:) = [dmc_outer/2 + 0.25   0];
        pl(2,:) = [dmc_outer/2 + 0.25   edge_dim_mc];
        pl(3,:) = [edge_dim_mc   dmc_outer/2 + 0.25];
        pl(4,:) = [-edge_dim_mc   dmc_outer/2 + 0.25];
        pl(5,:) = [-dmc_outer/2 - 0.25   edge_dim_mc];
        pl(6:10,:) = [pl(5:-1:1,1)   -pl(5:-1:1,2)];
        
        pl1 = [0 0];
        pl2 = [0 0];
        pl3 = [0 0];
        pl4 = [0 0];
                
    end
    
    if sum(center_hole) == 0 && sum(corner_hole) ~= 0
        
        cirprop(1,:) = [corner_hole(1) corner_hole(2)];
        cirprop(2,:) = [corner_hole(2) corner_hole(1)];
        cirprop(3,:) = [-corner_hole(1) corner_hole(2)];
        cirprop(4,:) = [-corner_hole(2) corner_hole(1)];
        cirprop(5:8,:) = [cirprop(4:-1:1,1)   -cirprop(4:-1:1,2)];
        
        
        % dimensioning of the plan
        c2(1,:) = [-dmc_outer/2 - 1       0];
        c2(2,:) = [-dmc_outer/2 - 16      0];
        c2(3,:) = [-dmc_outer/2 - 4       0];
        c2(4,:) = [-dmc_outer/2 - 4      -min(abs(corner_hole))];
        c2(5,:) = [-dmc_outer/2 - 1      -min(abs(corner_hole))];
        c2(6,:) = [-dmc_outer/2 - 6      -min(abs(corner_hole))];
        
        c3(1,:) = [-dmc_outer/2 - 10   0];
        c3(2,:) = [-dmc_outer/2 - 10   -max(abs(corner_hole))];
        c3(3,:) = [-dmc_outer/2 - 8    -max(abs(corner_hole))];
        c3(4,:) = [-dmc_outer/2 - 12   -max(abs(corner_hole))];
        
        c4 = [c2(1:6,2)   c2(1:6,1)];
        c5 = [c3(1:4,2)   c3(1:4,1)];
        
        c6 = [0 0];
        c7 = [0 0];
        
        T3 = [c3(1,1) - 2   (c3(2,2) - c3(1,2))/2];
        T2 = [c2(3,1) - 3   (c2(4,2) - c2(3,2))/2];
        T4 = [(c4(4,1) - c4(3,1))/2    c4(3,2) - 1];
        T5 = [(c5(2,1) - c5(1,1))/2    c5(1,2) - 1]; 
        
        T6 = [0 0];
        T7 = [0 0];
        
    elseif  sum(center_hole) ~=0 && sum(corner_hole) == 0
        
        cirprop(1,:) = [center_hole center_hole];
        cirprop(2,:) = [-center_hole center_hole];
        cirprop(3:4,:) = [cirprop(2:-1:1,1)   -cirprop(2:-1:1,2)];
        
        
        % dimensioning
        c6(1,:) = [-dmc_outer/2 - 1       0];
        c6(2,:) = [-dmc_outer/2 - 6       0];
        c6(3,:) = [-dmc_outer/2 - 4       0];
        c6(4,:) = [-dmc_outer/2 - 4      -center_hole];
        c6(5,:) = [-dmc_outer/2 - 1      -center_hole];
        c6(6,:) = [-dmc_outer/2 - 6      -center_hole];
        
        c7 = [c6(1:6,2)   c6(1:6,1)];
         
        c2 = [0 0];
        c3 = [0 0];
        c4 = [0 0];
        c5 = [0 0];
        
        T6 = [c6(3,1) - 3   (c6(4,2) - c6(3,2))/2];
        T7 = [(c7(4,1) - c7(3,1))/2     c7(3,2) - 1];
        
        T2 = [0 0];
        T3 = [0 0];
        T4 = [0 0];
        T5 = [0 0];
               
        
    elseif  sum(center_hole) ~=0 && sum(corner_hole) ~= 0
        
        cirprop(1,:) = [corner_hole(1) corner_hole(2)];
        cirprop(2,:) = [corner_hole(2) corner_hole(1)];
        cirprop(3,:) = [-corner_hole(1) corner_hole(2)];
        cirprop(4,:) = [-corner_hole(2) corner_hole(1)];
        cirprop(5:8,:) = [cirprop(4:-1:1,1)   -cirprop(4:-1:1,2)];
        
        cirprop(9,:) = [center_hole center_hole];
        cirprop(10,:) = [-center_hole center_hole];
        cirprop(11:12,:) = [cirprop(10:-1:9,1)   -cirprop(10:-1:9,2)];
        
        % dimensioning
        
        c2(1,:) = [-dmc_outer/2 - 1       0];
        c2(2,:) = [-dmc_outer/2 - 16      0];
        c2(3,:) = [-dmc_outer/2 - 4       0];
        c2(4,:) = [-dmc_outer/2 - 4        -min(abs(corner_hole))];
        c2(5,:) = [-dmc_outer/2 - 1        -min(abs(corner_hole))];
        c2(6,:) = [-dmc_outer/2 - 6        -min(abs(corner_hole))];
        
        c3(1,:) = [-dmc_outer/2 - 10      0];
        c3(2,:) = [-dmc_outer/2 - 10     -max(abs(corner_hole))];
        c3(3,:) = [-dmc_outer/2 - 8      -max(abs(corner_hole))];
        c3(4,:) = [-dmc_outer/2 - 12     -max(abs(corner_hole))];
        
 
        c6(1,:) = [-(-dmc_outer/2 - 1)        0];
        c6(2,:) = [-(-dmc_outer/2 - 10)       0];
        c6(3,:) = [-(-dmc_outer/2 - 8)        0];              % related to the center hole
        c6(4,:) = [-(-dmc_outer/2 - 8)     -center_hole];
        c6(5,:) = [-(-dmc_outer/2 - 1)     -center_hole];
        c6(6,:) = [-(-dmc_outer/2 - 10)    -center_hole];
        
        c4 = [c2(1:6,2)   c2(1:6,1)];
        c5 = [c3(1:4,2)   c3(1:4,1)];
        c7 = [-c6(1:6,2)   -c6(1:6,1)];     % related to the center hole
        
        T3 = [c3(1,1) - 2      (c3(2,2) - c3(1,2))/2];
        T2 = [c2(3,1) - 3      (c2(4,2) - c2(3,2))/2];
        T4 = [(c4(4,1) - c4(3,1))/2    c4(3,2) - 1];
        T5 = [(c5(2,1) - c5(1,1))/2    c5(1,2) - 1];
        T6 = [c6(3,1) + 5      (c6(4,2) - c6(3,2))/2];
        T7 = [(c7(4,1) - c7(3,1))/2     c7(3,2) - 1];
        
        
        
        
    else
        
        cirprop(1,:) = [0 0];
         
    end
    
  
 %dimentioning
 
 c1(1,:) = [-dmc_outer/2 - 4     -dmc_outer/2];
 c1(2,:) = [-dmc_outer/2 - 18    -dmc_outer/2]; 
 c1(3,:) = [-dmc_outer/2 - 16    -dmc_outer/2];
 c1(4,:) = [-dmc_outer/2 - 16     dmc_outer/2];
 c1(5,:) = [-dmc_outer/2 - 4      dmc_outer/2];
 c1(6,:) = [-dmc_outer/2 - 18     dmc_outer/2];
 
 sp1(1,:) = [7    dmc_outer/2];                  % Shipping plates
 sp1(2,:) = [7    dmc_outer/2 + 1];
 sp1(3,:) = [5.5  dmc_outer/2 + 1];
 sp1(4,:) = [5.5  dmc_outer/2 + 3];
 sp1(5,:) = [2.5  dmc_outer/2 + 3];
 sp1(6,:) = [2.5  dmc_outer/2 + 1];
 sp1(7:12,:) = [-sp1(6:-1:1,1) sp1(6:-1:1,2)];
 
 sp2 = [sp1(:,1) -sp1(:,2)];
 
 sp3 = [sp1(:,2)  sp1(:,1)];
 
 sp4 = [-sp3(:,1)  sp3(:,2)];
     
 T8 = [sp1(2,1) + 2  sp1(2,2) + 5];
 
 
 
 T1 = [c1(3,1) - 5     0];
  
end
