function [Teff,keff,eta] = RegimePropertyGenerator(p)

       
           % Acceleration due to gravity (in/sec^2)
           g = 386.4;
           
           % Length of 'p' vector
           L=length(p(:,1));
           
           % Area enclosed by the hysteresis loop
      
           if L > 7
             A = polyarea(p(4:L,1),p(4:L,2));
           else
             A = polyarea(p(3:L,1),p(3:L,2));
           end
           
           % effective Stiffness
           keff = max(p(:,2))/max(p(:,1));
           
           % damping ratio 
           eta = A / (2*pi*keff*max(p(:,1))^2);
           
           % Effective Period of the Isolator depending on displacements
           Teff = 2*pi*sqrt(1/(keff*g));

end