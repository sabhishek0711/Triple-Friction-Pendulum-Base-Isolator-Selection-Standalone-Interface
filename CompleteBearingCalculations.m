function [p,p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,q6,r1,r2,r3,Pu_bearing,Pall_build_bearing,Pall_bridge_bearing]=CompleteBearingCalculations(S,fc,SiteSpectra)

% Input the part names from different callbacks and matching them with the
% database

% loading .mat files
load('OuterConcave.mat');
load('SliderConcave.mat');
load('InnerSlider.mat');

% obtaining the value of checkbox
checkbox=getappdata(0,'checkbox');

% finding the lengths of the .mat files
L1=length(OuterConcave(:,1));
L2=length(SliderConcave(:,1));
L3=length(InnerSlider(:,1));

% getting friction from root directory
mu1=getappdata(0,'mu1value');
mu2=getappdata(0,'mu2value');
mu3=getappdata(0,'mu3value');

% Converting from string to integer
mu1=str2double(mu1);
mu2=str2double(mu2);
mu3=str2double(mu3);

mu1=mu1/100;
mu2=mu2/100;
mu3=mu3/100;

mu_UB1=getappdata(0,'mu_UB1');
mu_UB2=getappdata(0,'mu_UB2');
mu_UB3=getappdata(0,'mu_UB3');
mu_LB1=getappdata(0,'mu_LB1');
mu_LB2=getappdata(0,'mu_LB2');
mu_LB3=getappdata(0,'mu_LB3');

mu_UB1 = str2double(mu_UB1);
mu_UB2 = str2double(mu_UB2);
mu_UB3 = str2double(mu_UB3);

mu_LB1 = str2double(mu_LB1);
mu_LB2 = str2double(mu_LB2);
mu_LB3 = str2double(mu_LB3);

mu_UB1 = mu_UB1/100;
mu_UB2 = mu_UB2/100;
mu_UB3 = mu_UB3/100;


mu_LB1 = mu_LB1/100;
mu_LB2 = mu_LB2/100;
mu_LB3 = mu_LB3/100;


% check for paired sliders
if checkbox == 0
        % getting data from root directory 
        n1=getappdata(0,'n1value');
        n2=getappdata(0,'n2value');
        n3=getappdata(0,'n3value');

        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
            end
        end

        for i=1:L3
            if strcmp(n3,InnerSlider(i,1))
                temp3=InnerSlider(i,:);
            end
        end
        
        
else 
       % getting data from root directory
         n1=getappdata(0,'n1value');
         n2=getappdata(0,'n2value');
        
        % matching the user inputed variables with the dataset
        for i=1:L1
            if strcmp(n1,OuterConcave(i,1))
                temp1=OuterConcave(i,:);
            end
        end

        for i=1:L2
            if strcmp(n2,SliderConcave(i,1))
                temp2=SliderConcave(i,:);
                temp3=InnerSlider(i,:);
            end
        end
        
        
end 




%Storing the data properties of three isolator parts 
temp1=cell2mat(temp1(2:length(OuterConcave(3,:))));
temp2=cell2mat(temp2(2:length(SliderConcave(3,:))));
temp3=cell2mat(temp3(2:length(InnerSlider(3,:))));

%Additional Parameters
overlay= 0.1; % inches
liner=0.1;    % inches         
% Calc the total height of the Isolator and other related heights(
% Convention following Stanley's spreadsheet.
Ht= temp3(2) + 2*temp2(5) + 2*temp1(3) + 2*overlay + 2*liner; %height of TP
Hi=temp3(2);                                      % Height of inner slider   
Hs=temp3(2) + 2*temp2(5);                         % Height upto slider conc
dmc=temp1(2);                           % Plan Internal dia of main concave           
dso=temp2(1);                           % plan inner dia of slider concave
dsi=temp2(3);                           % plan outer dia of inner slider
Inner=temp3(1);                         % dia of inner slider
R1=temp2(2);                            % Radius of slider concave
R2=temp1(1);                            % Radius of Main Concave
scr_radius = temp2(7);                % corner radius of scr-Slider Concave
dmc_outer = temp1(2) + 2*temp1(5);    % outer diameter of main concave


% Calc of effective Radii of three distinct surfaces
L1=2*R1 - Hi;
L3=2*R2 - Hs;
L2=(L1+L3)/2;

setappdata(0,'L3',L3);


% Calc of terminal displacements for each regime ( I to V )
Dsc= (L1/(2*R1))*(dsi-Inner);
Dmc=(L3/(2*R2))*(dmc_outer-dso);

D1=(mu2-mu1)*L1;
D2=(mu3-mu2)*L2 +D1;
D4 = Dmc + (mu3-mu1)*L1;
D3 = D4 - (mu3-mu2)*L2;
D5 =Dsc + Dmc;

% Making Nicole's Hysteresis Loop Work (force loop based on capacity, NOT demand) ( 5 Regimes )
Rvec=[R1 R2];
dvec=[dmc_outer dso dsi Inner];   
Hvec=[Hi Hs];
muvec=[mu1 mu2 mu3];

[p1,p2,p3,p4,p5]=getnicoleloopS3(Rvec, dvec, Hvec, muvec);



% Storing values in root directory
setappdata(0,'p5max',p5(7,1));
setappdata(0,'p4max',p4(6,1));



% Generation of Section, Elevation and Plan View of TP (To Scale)
% hsi,tsc,dmc,Rmc,dmc_outer,tmc,hsi,dsc,Rsc,dsc_outer
% Hi,temp2(5),dmc,R2,temp1(6),temp1(3),Hi,temp2(3),R1,temp2(1)

hsi = Hi;
tsc = temp2(5);
Rmc = R2;
dmc_outer = temp1(2) + 2*temp1(5);
tmc = temp1(3);
dsc = temp2(3);
Rsc = R1;
dsc_outer = temp2(1);
dsi = temp3(1);
Rsc_outer = temp2(4);

% To Scale drawing of the SECTION 
[q1,q2,q3,q4,q5,q6,c1,c2,c3,c4,c5,c6,P1,P2,P3,P4,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10]=ToScaleDrawing_section(hsi,tsc,dmc,Rmc,dmc_outer,tmc,dsc,Rsc,dsc_outer, dsi, Ht, Hs, Rsc_outer, scr_radius);                 






% Report Generation and Hole filling in MS Word Template_6

% Mass = W*wt_conv/(g*1000);    % SI: Kilo-kg, AUnit: kips/g
% Rot_inertia = Mass*(dmc*k_m)^2/8;
% rate = 1.25/k_m ;
% friction(1,:) = [mu_UB1; mu_UB2; mu_UB3];
% friction(2,:) = [mu_LB1; mu_LB2; mu_LB3];
% friction(3,:) = [mu1; mu2; mu3];
% E = 29000;
% A = (pi*dsc_outer^2/4 + pi*dsi^2/4)/2;
% kv = 0.05*A*E*wt_conv/Ht*k_m;
% mytemplate_6_generator(temp1,temp2,temp3,Mass,W,Rot_inertia,Hvec,friction,rate,Rvec,D5,kv,k_m,Overall_units,unit_m);



% Report Generation and Hole filling in MS Word Template_7
% Generate Demand Based Hysteresis Loop based on Response Spectra provided
% by User

  %Sd1 = get(handles.Sd1, 'Value') ; 
%   Sd1 = str2num(get(handles.Sd1,'String'));
%   Sm1 = str2num(get(handles.Sm1,'String'));
  friction(1,:) = [mu_UB1  mu_UB2  mu_UB3];
  friction(2,:) = [mu_LB1  mu_LB2  mu_LB3];
  friction(3,:) = [mu1  mu2  mu3];
  
 c = 1;
  for i=1:3
           muvec = friction(i,:);
           [~,~,~,~,p5]=getnicoleloopS3(Rvec, dvec, Hvec, muvec);
           [p,D(i),Shear(i),Teff(i),Damping(i),Keff(i)]=DisplacementDemandCalc(p5,Rvec, dvec, Hvec, muvec, S(i), SiteSpectra(:,c:c+1));
           if i==1
                    r1 = p;
                    setappdata(0,'DBE_resp',r1);
                    
           elseif i==2
               
                    r2 = p;
                    setappdata(0,'MCE_resp',r2);
                    
           else
                    r3 = p;
           end
      c = c+2;           
  end 
  
  % Calculating the bearing capacities
  
  fc = fc/1000;
  fy = 40;
  tb = 0;
  thc = [0.65 1];
  ths = [0.90 1];
  
  for i = 1:2
      [tc, teff, Fbu(i), Mu(i), b1(i), ratio(i), r(i), Mus(i), Muext(i), Pu(i), Pallbuild(i), Pallbridge(i), Area, Pusi60, Pysi40, Pall_build, Pall_bridge, CF(i)] = VirticalLoadCapacityCircular(dsi,Rmc,dsc_outer,tmc,tb,fc,fy,thc(i),ths(i));
  end
  
  Pu_vec = [Pu(1) Pu(2) Pusi60];
  Pu_bearing = min(Pu_vec);
  Pall_build_vec = [Pu_bearing/1.4   Pall_build];
  Pall_build_bearing = min(Pall_build_vec);
  Pall_bridge_vec = [Pu_bearing/1.5  Pall_bridge];
  Pall_bridge_bearing = min(Pall_bridge_vec);
  

end