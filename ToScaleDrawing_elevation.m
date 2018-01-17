function [e1, e2, e3, c1, T1]=ToScaleDrawing_elevation(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, edge_dim_mc)

    e1(1,:) = [0  Ht/2];
    e1(2,:) = [edge_dim_mc/2    Ht/2];
    e1(3,:) = [edge_dim_mc/2    Hs/2];
    e1(4,:) = e1(2,:);
    e1(5,:) = [dmc_outer/2     Ht/2];
    e1(6,:) = [dmc_outer/2     Hs/2];
    e1(7:12,:) = [-e1(6:-1:1,1) e1(6:-1:1,2)];
    
    e3 = [e1(:,1)  -e1(:,2)];
    
    e2(1,:) = [dmc_outer/2 - 0.5   Hs/2];
    e2(2,:) = [dmc_outer/2 - 0.5   Hs/2 - 0.5];
    e2(3,:) = [dmc_outer/2    Hs/2 - 0.5];
    e2(4,:) = [dmc_outer/2   0];
    e2(5,:) = [dmc_outer/2 + 0.8   -e2(2,2)];
    e2(6,:) = [dmc_outer/2 - 0.5   -e2(2,2)];
    e2(7,:) = [dmc_outer/2 - 0.5    -Hs/2 ];
    e2(8,:) = e2(6,:);
    e2(9:16,:) = [-e2(8:-1:1,1)   e2(8:-1:1,2)];
    e2(17,:) = e2(15,:);
    e2(18,:) = e2(2,:);
    
    % Labelling matrices
    
    c1(1,:) = [dmc_outer/2 + 0.5     Hs/2];
    c1(2,:) = [dmc_outer/2 + 3.5     Hs/2];
    c1(3,:) = [dmc_outer/2 + 2.0     Hs/2];
    c1(4,:) = [dmc_outer/2 + 2.0     Ht/2];
    c1(5,:) = [dmc_outer/2 + 0.5     Ht/2];
    c1(6,:) = [dmc_outer/2 + 3.5     Ht/2];
    
    % Text coordinates
    T1(1,:) = [dmc_outer/2 + 6.5    Hs/2 + (Ht-Hs)/4];
    
    
    
end