function p=DemandHysteresisLoopGenerator(p5, Dispdemand, Rvec, dvec, Hvec, muvec)
      
    % R1: Effective radius of slider concave
    % R2: Effective radius of concave
    R1 = Rvec(1);
    R2 = Rvec(2);
    
    % d_concave: Plan diameter of concave
    % d_slideroutside: Plan outer diameter of slider concave
    % d_sliderinside: Plan inner diameter of slider concave
    % d_inner: Plan diameter of inner slider
    d_concave = dvec(1);
    d_slideroutside = dvec(2);
    d_sliderinside = dvec(3);
    d_inner = dvec(4);
    
    % D1 : Max displacement of Regime I
    % D2 : Max displacement of Regime II
    % D3 : Max displacement of Regime III
    % D4 : Max displacement of Regime IV
    % D5 : Max displacement of Regime V    
    D1=p5(3,1);
    D2=p5(4,1);
    D3=p5(5,1);
    D4=p5(6,1);
    D5=p5(7,1);
    
    % H1: Height of inner slider
    % H2: Height of concave
    H1 = Hvec(1);
    H2 = Hvec(2);
    
    % mu1: Friction value of slider concave surface, which the inner slider
    % slides on.  Assumed to be the same on either side.
    % mu2: Friction value of concave surface that slider concave slides on (lower) 
    % mu3: Friction value of concave surface that slider concave slides on
    % (upper).  This value must be >= mu2.
    mu1 = muvec(1);
    mu2 = muvec(2);
    mu3 = muvec(3);
    
    % Calculation of Slopes
    m1 = 2*R1 - H1;
    m3 = 2*R2 - H2;
    m2 = .5*(m1 + m3);
    
    % Calculation of Key Displacement Capacities
    D_concave = (m3/(2*R2))*(d_concave - d_slideroutside);
    D_sliderconcave = (m1/(2*R1))*(d_sliderinside - d_inner);
    
    % Calculating and storing the points of hysteresis loop depending
    % on the displacement demand 
    
    if Dispdemand <= D1     % Inside regime I
        
           p = zeros(7, 2);
           p(1, :) = [0 0];
           p(2, :) = [0 mu1];
           p(3, :) = [Dispdemand (Dispdemand/m1)+mu1];
           p(4, :) = [Dispdemand (Dispdemand/m1)+mu1-2*mu1];
           p(5, :) = -p(3, :);
           p(6, :) = -p(4, :);
           p(7, :) = p(3, :); 
           
    elseif Dispdemand > D1 && Dispdemand <= D2     % Inside Regime II
        
           p = zeros(10, 2);
           p(1, :) = [0 0];
           p(2, :) = [0 mu1];
           p(3, :) = [D1 mu2];
           p(4, :) = [Dispdemand (Dispdemand - D1)/m2 + mu2];
           p(5, :) = [p(4,1) (Dispdemand - (mu2-mu1)*m1)/m2 + mu2 - 2*mu1];
           p(6, :) = [p(4,1)-2*D1 p(5,2)-2*(mu2-mu1)];
           p(7, :) = -p(4, :);
           p(8, :) = -p(5, :);
           p(9, :) = -p(6, :);
           p(10, :) = p(4, :);
        
    elseif Dispdemand > D2 && Dispdemand <= D3       % Inside regime III
           
           p = zeros(14, 2);
           p(1, :) = [0 0];
           p(2, :) = [0 mu1];
           p(3, :) = [D1 mu2];
           p(4, :) = [D2 mu3];
           p(5, :) = [Dispdemand               (1/m3)*(Dispdemand - D2) + mu3];
           p(6, :) = [p(5,1)                    p(5,2)-2*mu1];
           p(7, :) = [p(6,1)-2*D1               p(6,2)-2*(mu2 - mu1)]; 
           p(8, :) = [p(7,1)-2*m2*(mu3 - mu2)   p(7,2) - 2*(mu3 - mu2)];
           p(9, :) = -p(4, :);
           p(10, :) = -p(5, :);
           p(11, :) = -p(6, :);
           p(12, :) = -p(7, :);
           p(13, :) = -p(8, :);
           p(14, :) = p(4, :);
 
        
    elseif Dispdemand > D3 && Dispdemand <= D4       % Insider Regime IV
        
         p = zeros(16, 2);
         p(1, :) = [0 0];
         p(2, :) = [0 mu1];
         p(3, :) = [D1 mu2];
         p(4, :) = [D2 mu3];
         p(5, :) = [D3          (1/m3)*(D3 - D2) + mu3];
         p(6, :) = [Dispdemand  (1/m2)*(Dispdemand - D3) + p(5,2)];
         p(7, :) = [p(6,1)      p(6,2) - 2*mu1];
         
         a= (p(7,2)-(p(5,2)-(2*mu1)- 2*(mu2 - mu1)) + (1/m2)*(D3 - 2*m1*(mu2 - mu1)) - (1/m1)*p(7,1))/((1/m2) - (1/m1));
         
         p(8, :) = [a   (1/m1)*(a - p(7,1)) + p(7,2)];
         p(9, :) = [D_concave + (mu3 - mu1)*m1 - (mu3 - mu2)*m2 - 2*m1*(mu2 - mu1) - 2*m2*(mu3 - mu2)    p(5,2)-(2*mu1)-(2*(mu2 - mu1))- 2*(mu3 - mu2)];   
         p(10, :) = -p(4, :);
         p(11, :) = -p(5, :);
         p(12, :) = -p(6, :);
         p(13, :) = -p(7, :);
         p(14, :) = -p(8, :);
         p(15, :) = -p(9, :);
         p(16, :) = p(4, :);
    
    elseif Dispdemand > D4 && Dispdemand <= D5       % Inside Regime V
         p = zeros(18, 2);
         p(1, :) = [0 0];
         p(2, :) = [0 mu1];
         p(3, :) = [D1 mu2];
         p(4, :) = [D2 mu3];
         p(5, :) = [D3          (1/m3)*(D3 - D2) + mu3]; 
         p(6, :) = [D4  (1/m2)*(D4 - D3) + p(5,2)];
         p(7, :) = [Dispdemand     (1/m1)*(Dispdemand - D4) + p(6,2)];
         p(8, :) = [p(7,1)   p(7,2) - 2*mu1];
         
         a= (p(6,2)-2*mu1 - (p(5,2)- 2*mu1- 2*(mu2 - mu1)) + (1/m2)*(D3 - 2*m1*(mu2 - mu1)) - (1/m1)*D4)/((1/m2) - (1/m1)); 
         
         p(9, :) =[a  (1/m1)*(a - D4) + p(6,2)-2*mu1];
         p(10, :) =[D_concave + (mu3 - mu1)*m1 - (mu3 - mu2)*m2 - 2*m1*(mu2 - mu1) - 2*m2*(mu3 - mu2)    p(5,2)-(2*mu1)-(2*(mu2 - mu1))- 2*(mu3 - mu2)];
         p(11, :) = -p(4, :);
         p(12, :) = -p(5, :);
         p(13, :) = -p(6, :);
         p(14, :) = -p(7, :);
         p(15, :) = -p(8, :);
         p(16, :) = -p(9, :);
         p(17, :) = -p(10, :);
         p(18, :) = p(4, :);
   
   end

end