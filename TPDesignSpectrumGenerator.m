function [Teff,Sa,d]=TPDesignSpectrumGenerator(p5,Rvec, dvec, Hvec, muvec)

       D5 = p5(7,1);  % max displacement of the isolator
       
       % displacement range
       d = 0.1:0.05:D5;

       for i=1:length(d)
           
           p = DemandHysteresisLoopGenerator(p5,d(i),Rvec, dvec, Hvec, muvec);
           
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
           Teff(i) = 2*pi*sqrt(1/(keff*g));
           
           % Specta modification factor (ASCE 7-10 AASHTO Eq) due to damping
           spectra_mod_factor = (eta/0.05)^0.3;
           
           % The spectral ordinates stored as a vector
           Sa(i) = (4*pi^2/(Teff(i)^2))*d(i);
           
       end


end